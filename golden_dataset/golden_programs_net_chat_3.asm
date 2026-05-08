; DESCRIPTION: A colored object centered at the screen with fixed size.

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

LDI r4, 1              ; increment constant
LDI r12, 256            ; screen width
LDI r0, 0              ; frame counter

; Clear screen to dark blue
LDI r11, 0x000033
FILL r11

; Draw title bar
LDI r11, 0x00
LDI r15, 0
LDI r7, 256
LDI r14, 1
LDI r6, 0x333333
RECTF r11, r15, r7, r14, r6

; Draw status bar at bottom
LDI r11, 0
LDI r15, 250
LDI r7, 256
LDI r14, 6
LDI r6, 0x222222
RECTF r11, r15, r7, r14, r6

; Write "Pixel Chat - Waiting..." text at top
LDI r8, 0x2000
LDI r1, 80             ; 'P'
STORE r8, r1
LDI r8, 0x2001
LDI r1, 105            ; 'i'
STORE r8, r1
LDI r8, 0x2002
LDI r1, 120            ; 'x'
STORE r8, r1
LDI r8, 0x2003
LDI r1, 101            ; 'e'
STORE r8, r1
LDI r8, 0x2004
LDI r1, 108            ; 'l'
STORE r8, r1
LDI r8, 0x2005
LDI r1, 0              ; null
STORE r8, r1

LDI r8, 0x2000
LDI r1, 2
LDI r2, 8
LDI r3, 0xFFFFFF
TEXT r8, r1, r3

; Main loop: poll for incoming frames
main_loop:
  ; Update frame counter
  ADD r0, r4
  LDI r11, 0xFFE
  STORE r11, r0

  ; Poll NET_RECV
  LDI r11, 0x7100     ; receive buffer
  LDI r15, 256        ; max length
  NET_RECV r11, r15

  ; Check if we got data (r10 > 0 means data received)
  LDI r7, 0
  CMP r10, r7
  JZ r10, no_data

  ; Data received! Check frame type
  LDI r14, 0x7100
  LOAD r14, r14         ; r14 = frame type
  LDI r6, 1
  CMP r14, r6
  JZ r10, got_chat       ; type 1 = chat message

  ; Type 0 = screen share - display pixels
  ; Pixel data starts at 0x7104 (after 4-byte header)
  ; For now, just flash the screen green briefly
  LDI r11, 0x003300
  FILL r11
  FRAME
  JMP main_loop

got_chat:
  ; Chat message received - display in status bar
  ; Change status bar color to indicate message
  LDI r11, 0
  LDI r15, 250
  LDI r7, 256
  LDI r14, 6
  LDI r6, 0x004400    ; green tint = message received
  RECTF r11, r15, r7, r14, r6
  FRAME
  JMP main_loop

no_data:
  ; Animate waiting indicator (blinking dot)
  LDI r11, 0xFFE
  LOAD r11, r11         ; r11 = TICKS
  LDI r15, 30
  AND r11, r15          ; r11 = TICKS & 30
  LDI r15, 15
  CMP r11, r15
  BLT r10, dot_on

  ; Dot off - draw black pixel at (128, 4)
  LDI r11, 128
  LDI r15, 4
  LDI r7, 0x000000
  PSET r11, r15, r7
  FRAME
  JMP main_loop

dot_on:
  LDI r11, 128
  LDI r15, 4
  LDI r7, 0xFFFFFF
  PSET r11, r15, r7
  FRAME
  JMP main_loop

HALT
