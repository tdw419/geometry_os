; DESCRIPTION: Renders a green box of size 84x12 starting at (144, 128).
; PLAN: r0=144(x), r1=128(y), r2=84(width), r3=12(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 128
LDI r2, 84
LDI r3, 12
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
