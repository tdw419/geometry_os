; PixelPack Seed: 0x23456789 (591751049)
; Pattern=2, ColorA=0x0000FF, ColorB=0xFFFF00
; Density=6, Offset=(103,137)

; === Registers ===
LDI r10, 0   ; color A
LDI r11, 0   ; color B
LDI r20, 0   ; temp x
LDI r21, 0   ; temp y
LDI r22, 0   ; temp w
LDI r23, 0   ; temp h
LDI r30, 1   ; const 1

LDI r10, 0x0000FF  ; Color A
LDI r11, 0xFFFF00  ; Color B

; Pattern 2: Vertical stripes
LDI r20, 0
LDI r21, 0
LDI r22, 256
LDI r23, 256
RECTF r20, r21, r22, r23, r11
LDI r20, 0
LDI r21, 0
LDI r22, 12
LDI r23, 256
RECTF r20, r21, r22, r23, r10
LDI r20, 24
LDI r21, 0
LDI r22, 12
LDI r23, 256
RECTF r20, r21, r22, r23, r10
LDI r20, 48
LDI r21, 0
LDI r22, 12
LDI r23, 256
RECTF r20, r21, r22, r23, r10
LDI r20, 72
LDI r21, 0
LDI r22, 12
LDI r23, 256
RECTF r20, r21, r22, r23, r10
LDI r20, 96
LDI r21, 0
LDI r22, 12
LDI r23, 256
RECTF r20, r21, r22, r23, r10
LDI r20, 120
LDI r21, 0
LDI r22, 12
LDI r23, 256
RECTF r20, r21, r22, r23, r10
LDI r20, 144
LDI r21, 0
LDI r22, 12
LDI r23, 256
RECTF r20, r21, r22, r23, r10
LDI r20, 168
LDI r21, 0
LDI r22, 12
LDI r23, 256
RECTF r20, r21, r22, r23, r10
LDI r20, 192
LDI r21, 0
LDI r22, 12
LDI r23, 256
RECTF r20, r21, r22, r23, r10
LDI r20, 216
LDI r21, 0
LDI r22, 12
LDI r23, 256
RECTF r20, r21, r22, r23, r10
LDI r20, 240
LDI r21, 0
LDI r22, 12
LDI r23, 256
RECTF r20, r21, r22, r23, r10

FRAME
HALT
