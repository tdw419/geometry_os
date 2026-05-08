; DESCRIPTION: Draw object: pos=the screen, color=colored, size=fixed size.

; net_chat.asm -- Pixel Chat Demo (Phase 71: Pixel Network Protocol)
;
; Demonstrates bidirectional NET_RECV for receiving pixel data from a peer.
; Listens for incoming pixel protocol frames and displays them on screen.
; Also shows a simple text interface using NET_SEND for chat messages.
;
; For testing without a real network: push frames into vm.net_inbox
; using the test harness. The demo polls NET_RECV each frame.
;
; Protocol:
;   Frame type 0 (screen_share): display pixels on screen
;   Frame type 1 (chat): display text message in status bar

LDI r6, 1              ; increment constant
LDI r5, 256            ; screen width
LDI r0, 0              ; frame counter

; Clear screen to dark blue
LDI r3, 0x000033
FILL r3

; Draw title bar
LDI r3, 0x00
LDI r4, 0
LDI r2, 256
LDI r8, 1
LDI r12, 0x333333
RECTF r3, r4, r2, r8, r12

; Draw status bar at bottom
LDI r3, 0
LDI r4, 250
LDI r2, 256
LDI r8, 6
LDI r12, 0x222222
RECTF r3, r4, r2, r8, r12

; Write "Pixel Chat - Waiting..." text at top
LDI r11, 0x2000
LDI r10, 80             ; 'P'
STORE r11, r10
LDI r11, 0x2001
LDI r10, 105            ; 'i'
STORE r11, r10
LDI r11, 0x2002
LDI r10, 120            ; 'x'
STORE r11, r10
LDI r11, 0x2003
LDI r10, 101            ; 'e'
STORE r11, r10
LDI r11, 0x2004
LDI r10, 108            ; 'l'
STORE r11, r10
LDI r11, 0x2005
LDI r10, 0              ; null
STORE r11, r10

LDI r11, 0x2000
LDI r10, 2
LDI r13, 8
LDI r7, 0xFFFFFF
TEXT r11, r10, r7

; Main loop: poll for incoming frames
main_loop:
  ; Update frame counter
  ADD r0, r6
  LDI r3, 0xFFE
  STORE r3, r0

  ; Poll NET_RECV
  LDI r3, 0x7100     ; receive buffer
  LDI r4, 256        ; max length
  NET_RECV r3, r4

  ; Check if we got data (r14 > 0 means data received)
  LDI r2, 0
  CMP r14, r2
  JZ r14, no_data

  ; Data received! Check frame type
  LDI r8, 0x7100
  LOAD r8, r8         ; r8 = frame type
  LDI r12, 1
  CMP r8, r12
  JZ r14, got_chat       ; type 1 = chat message

  ; Type 0 = screen share - display pixels
  ; Pixel data starts at 0x7104 (after 4-byte header)
  ; For now, just flash the screen green briefly
  LDI r3, 0x003300
  FILL r3
  FRAME
  JMP main_loop

got_chat:
  ; Chat message received - display in status bar
  ; Change status bar color to indicate message
  LDI r3, 0
  LDI r4, 250
  LDI r2, 256
  LDI r8, 6
  LDI r12, 0x004400    ; green tint = message received
  RECTF r3, r4, r2, r8, r12
  FRAME
  JMP main_loop

no_data:
  ; Animate waiting indicator (blinking dot)
  LDI r3, 0xFFE
  LOAD r3, r3         ; r3 = TICKS
  LDI r4, 30
  AND r3, r4          ; r3 = TICKS & 30
  LDI r4, 15
  CMP r3, r4
  BLT r14, dot_on

  ; Dot off - draw black pixel at (128, 4)
  LDI r3, 128
  LDI r4, 4
  LDI r2, 0x000000
  PSET r3, r4, r2
  FRAME
  JMP main_loop

dot_on:
  LDI r3, 128
  LDI r4, 4
  LDI r2, 0xFFFFFF
  PSET r3, r4, r2
  FRAME
  JMP main_loop

HALT
