; PixelPack Seed: 0xABCDE123 (2882396451)
; Pattern=10, ColorA=0x88FF00, ColorB=0xFF0088
; Density=14, Offset=(225,35)

; === Registers ===
LDI r10, 0   ; color A
LDI r11, 0   ; color B
LDI r20, 0   ; temp x
LDI r21, 0   ; temp y
LDI r22, 0   ; temp w
LDI r23, 0   ; temp h
LDI r30, 1   ; const 1

LDI r10, 0x88FF00  ; Color A
LDI r11, 0xFF0088  ; Color B

; Pattern 10: Diamond
LDI r20, 0
LDI r21, 0
LDI r22, 256
LDI r23, 256
RECTF r20, r21, r22, r23, r11
LDI r20, 128
LDI r21, 112
LDI r22, 144
LDI r23, 128
LINE r20, r21, r22, r23, r10
LDI r20, 144
LDI r21, 128
LDI r22, 128
LDI r23, 144
LINE r20, r21, r22, r23, r10
LDI r20, 128
LDI r21, 144
LDI r22, 112
LDI r23, 128
LINE r20, r21, r22, r23, r10
LDI r20, 112
LDI r21, 128
LDI r22, 128
LDI r23, 112
LINE r20, r21, r22, r23, r10
LDI r20, 128
LDI r21, 56
LDI r22, 200
LDI r23, 128
LINE r20, r21, r22, r23, r10
LDI r20, 200
LDI r21, 128
LDI r22, 128
LDI r23, 200
LINE r20, r21, r22, r23, r10
LDI r20, 128
LDI r21, 200
LDI r22, 56
LDI r23, 128
LINE r20, r21, r22, r23, r10
LDI r20, 56
LDI r21, 128
LDI r22, 128
LDI r23, 56
LINE r20, r21, r22, r23, r10

FRAME
HALT
