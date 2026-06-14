; PixelPack Seed: 0x12345678 (305419896)
; Pattern=1, ColorA=0x00FF00, ColorB=0x0000FF
; Density=5, Offset=(86,120)

; === Registers ===
LDI r10, 0   ; color A
LDI r11, 0   ; color B
LDI r20, 0   ; temp x
LDI r21, 0   ; temp y
LDI r22, 0   ; temp w
LDI r23, 0   ; temp h
LDI r30, 1   ; const 1

LDI r10, 0x00FF00  ; Color A
LDI r11, 0x0000FF  ; Color B

; Pattern 1: Horizontal stripes
LDI r20, 0
LDI r21, 0
LDI r22, 256
LDI r23, 256
RECTF r20, r21, r22, r23, r11
LDI r20, 0
LDI r21, 0
LDI r22, 256
LDI r23, 10
RECTF r20, r21, r22, r23, r10
LDI r20, 0
LDI r21, 20
LDI r22, 256
LDI r23, 10
RECTF r20, r21, r22, r23, r10
LDI r20, 0
LDI r21, 40
LDI r22, 256
LDI r23, 10
RECTF r20, r21, r22, r23, r10
LDI r20, 0
LDI r21, 60
LDI r22, 256
LDI r23, 10
RECTF r20, r21, r22, r23, r10
LDI r20, 0
LDI r21, 80
LDI r22, 256
LDI r23, 10
RECTF r20, r21, r22, r23, r10
LDI r20, 0
LDI r21, 100
LDI r22, 256
LDI r23, 10
RECTF r20, r21, r22, r23, r10
LDI r20, 0
LDI r21, 120
LDI r22, 256
LDI r23, 10
RECTF r20, r21, r22, r23, r10
LDI r20, 0
LDI r21, 140
LDI r22, 256
LDI r23, 10
RECTF r20, r21, r22, r23, r10
LDI r20, 0
LDI r21, 160
LDI r22, 256
LDI r23, 10
RECTF r20, r21, r22, r23, r10
LDI r20, 0
LDI r21, 180
LDI r22, 256
LDI r23, 10
RECTF r20, r21, r22, r23, r10
LDI r20, 0
LDI r21, 200
LDI r22, 256
LDI r23, 10
RECTF r20, r21, r22, r23, r10
LDI r20, 0
LDI r21, 220
LDI r22, 256
LDI r23, 10
RECTF r20, r21, r22, r23, r10
LDI r20, 0
LDI r21, 240
LDI r22, 256
LDI r23, 10
RECTF r20, r21, r22, r23, r10

FRAME
HALT
