; DESCRIPTION: Renders a green box of size 112x108 starting at (192, 86).
; PLAN: r0=192(x), r1=86(y), r2=112(width), r3=108(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 86
LDI r2, 112
LDI r3, 108
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
