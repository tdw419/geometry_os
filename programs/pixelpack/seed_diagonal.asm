; PixelPack Seed: 0x6789ABCD (1737075661)
; Pattern=6, ColorA=0xFFFFFF, ColorB=0xFF8800
; Density=10, Offset=(171,205)

; === Registers ===
LDI r10, 0   ; color A
LDI r11, 0   ; color B
LDI r20, 0   ; temp x
LDI r21, 0   ; temp y
LDI r22, 0   ; temp w
LDI r23, 0   ; temp h
LDI r30, 1   ; const 1

LDI r10, 0xFFFFFF  ; Color A
LDI r11, 0xFF8800  ; Color B

; Pattern 6: Diagonal
LDI r20, 0
LDI r21, 0
LDI r22, 256
LDI r23, 256
RECTF r20, r21, r22, r23, r11
LDI r20, 0
LDI r21, 0
LDI r22, 255
LDI r23, 255
LINE r20, r21, r22, r23, r10
LDI r20, 40
LDI r21, 0
LDI r22, 255
LDI r23, 39
LINE r20, r21, r22, r23, r10
LDI r20, 80
LDI r21, 0
LDI r22, 255
LDI r23, 79
LINE r20, r21, r22, r23, r10
LDI r20, 120
LDI r21, 0
LDI r22, 255
LDI r23, 119
LINE r20, r21, r22, r23, r10
LDI r20, 160
LDI r21, 0
LDI r22, 255
LDI r23, 159
LINE r20, r21, r22, r23, r10
LDI r20, 200
LDI r21, 0
LDI r22, 255
LDI r23, 199
LINE r20, r21, r22, r23, r10
LDI r20, 240
LDI r21, 0
LDI r22, 255
LDI r23, 239
LINE r20, r21, r22, r23, r10
LDI r20, 24
LDI r21, 0
LDI r22, 255
LDI r23, 23
LINE r20, r21, r22, r23, r10
LDI r20, 64
LDI r21, 0
LDI r22, 255
LDI r23, 63
LINE r20, r21, r22, r23, r10
LDI r20, 104
LDI r21, 0
LDI r22, 255
LDI r23, 103
LINE r20, r21, r22, r23, r10
LDI r20, 144
LDI r21, 0
LDI r22, 255
LDI r23, 143
LINE r20, r21, r22, r23, r10
LDI r20, 184
LDI r21, 0
LDI r22, 255
LDI r23, 183
LINE r20, r21, r22, r23, r10
LDI r20, 224
LDI r21, 0
LDI r22, 255
LDI r23, 223
LINE r20, r21, r22, r23, r10

FRAME
HALT
