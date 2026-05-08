; DESCRIPTION: Geometry OS program to draw a colored object.

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

LDI r9, 1              ; increment constant
LDI r2, 256            ; screen width
LDI r15, 0              ; frame counter

; Clear screen to dark blue
LDI r4, 0x000033
FILL r4

; Draw title bar
LDI r4, 0x00
LDI r12, 0
LDI r1, 256
LDI r11, 1
LDI r10, 0x333333
RECTF r4, r12, r1, r11, r10

; Draw status bar at bottom
LDI r4, 0
LDI r12, 250
LDI r1, 256
LDI r11, 6
LDI r10, 0x222222
RECTF r4, r12, r1, r11, r10

; Write "Pixel Chat - Waiting..." text at top
LDI r6, 0x2000
LDI r5, 80             ; 'P'
STORE r6, r5
LDI r6, 0x2001
LDI r5, 105            ; 'i'
STORE r6, r5
LDI r6, 0x2002
LDI r5, 120            ; 'x'
STORE r6, r5
LDI r6, 0x2003
LDI r5, 101            ; 'e'
STORE r6, r5
LDI r6, 0x2004
LDI r5, 108            ; 'l'
STORE r6, r5
LDI r6, 0x2005
LDI r5, 0              ; null
STORE r6, r5

LDI r6, 0x2000
LDI r5, 2
LDI r0, 8
LDI r8, 0xFFFFFF
TEXT r6, r5, r8

; Main loop: poll for incoming frames
main_loop:
  ; Update frame counter
  ADD r15, r9
  LDI r4, 0xFFE
  STORE r4, r15

  ; Poll NET_RECV
  LDI r4, 0x7100     ; receive buffer
  LDI r12, 256        ; max length
  NET_RECV r4, r12

  ; Check if we got data (r7 > 0 means data received)
  LDI r1, 0
  CMP r7, r1
  JZ r7, no_data

  ; Data received! Check frame type
  LDI r11, 0x7100
  LOAD r11, r11         ; r11 = frame type
  LDI r10, 1
  CMP r11, r10
  JZ r7, got_chat       ; type 1 = chat message

  ; Type 0 = screen share - display pixels
  ; Pixel data starts at 0x7104 (after 4-byte header)
  ; For now, just flash the screen green briefly
  LDI r4, 0x003300
  FILL r4
  FRAME
  JMP main_loop

got_chat:
  ; Chat message received - display in status bar
  ; Change status bar color to indicate message
  LDI r4, 0
  LDI r12, 250
  LDI r1, 256
  LDI r11, 6
  LDI r10, 0x004400    ; green tint = message received
  RECTF r4, r12, r1, r11, r10
  FRAME
  JMP main_loop

no_data:
  ; Animate waiting indicator (blinking dot)
  LDI r4, 0xFFE
  LOAD r4, r4         ; r4 = TICKS
  LDI r12, 30
  AND r4, r12          ; r4 = TICKS & 30
  LDI r12, 15
  CMP r4, r12
  BLT r7, dot_on

  ; Dot off - draw black pixel at (128, 4)
  LDI r4, 128
  LDI r12, 4
  LDI r1, 0x000000
  PSET r4, r12, r1
  FRAME
  JMP main_loop

dot_on:
  LDI r4, 128
  LDI r12, 4
  LDI r1, 0xFFFFFF
  PSET r4, r12, r1
  FRAME
  JMP main_loop

HALT
