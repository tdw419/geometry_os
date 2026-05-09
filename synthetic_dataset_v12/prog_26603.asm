; DESCRIPTION: Renders a green box of size 30x52 starting at (192, 66).
; PLAN: r0=192(x), r1=66(y), r2=30(width), r3=52(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 66
LDI r2, 30
LDI r3, 52
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
