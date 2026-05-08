; DESCRIPTION: Display a object using color colored at the screen.

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
LDI r1, 256            ; screen width
LDI r12, 0              ; frame counter

; Clear screen to dark blue
LDI r2, 0x000033
FILL r2

; Draw title bar
LDI r2, 0x00
LDI r11, 0
LDI r8, 256
LDI r14, 1
LDI r4, 0x333333
RECTF r2, r11, r8, r14, r4

; Draw status bar at bottom
LDI r2, 0
LDI r11, 250
LDI r8, 256
LDI r14, 6
LDI r4, 0x222222
RECTF r2, r11, r8, r14, r4

; Write "Pixel Chat - Waiting..." text at top
LDI r0, 0x2000
LDI r7, 80             ; 'P'
STORE r0, r7
LDI r0, 0x2001
LDI r7, 105            ; 'i'
STORE r0, r7
LDI r0, 0x2002
LDI r7, 120            ; 'x'
STORE r0, r7
LDI r0, 0x2003
LDI r7, 101            ; 'e'
STORE r0, r7
LDI r0, 0x2004
LDI r7, 108            ; 'l'
STORE r0, r7
LDI r0, 0x2005
LDI r7, 0              ; null
STORE r0, r7

LDI r0, 0x2000
LDI r7, 2
LDI r10, 8
LDI r3, 0xFFFFFF
TEXT r0, r7, r3

; Main loop: poll for incoming frames
main_loop:
  ; Update frame counter
  ADD r12, r6
  LDI r2, 0xFFE
  STORE r2, r12

  ; Poll NET_RECV
  LDI r2, 0x7100     ; receive buffer
  LDI r11, 256        ; max length
  NET_RECV r2, r11

  ; Check if we got data (r9 > 0 means data received)
  LDI r8, 0
  CMP r9, r8
  JZ r9, no_data

  ; Data received! Check frame type
  LDI r14, 0x7100
  LOAD r14, r14         ; r14 = frame type
  LDI r4, 1
  CMP r14, r4
  JZ r9, got_chat       ; type 1 = chat message

  ; Type 0 = screen share - display pixels
  ; Pixel data starts at 0x7104 (after 4-byte header)
  ; For now, just flash the screen green briefly
  LDI r2, 0x003300
  FILL r2
  FRAME
  JMP main_loop

got_chat:
  ; Chat message received - display in status bar
  ; Change status bar color to indicate message
  LDI r2, 0
  LDI r11, 250
  LDI r8, 256
  LDI r14, 6
  LDI r4, 0x004400    ; green tint = message received
  RECTF r2, r11, r8, r14, r4
  FRAME
  JMP main_loop

no_data:
  ; Animate waiting indicator (blinking dot)
  LDI r2, 0xFFE
  LOAD r2, r2         ; r2 = TICKS
  LDI r11, 30
  AND r2, r11          ; r2 = TICKS & 30
  LDI r11, 15
  CMP r2, r11
  BLT r9, dot_on

  ; Dot off - draw black pixel at (128, 4)
  LDI r2, 128
  LDI r11, 4
  LDI r8, 0x000000
  PSET r2, r11, r8
  FRAME
  JMP main_loop

dot_on:
  LDI r2, 128
  LDI r11, 4
  LDI r8, 0xFFFFFF
  PSET r2, r11, r8
  FRAME
  JMP main_loop

HALT
