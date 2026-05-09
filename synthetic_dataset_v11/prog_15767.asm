; DESCRIPTION: Renders a green box of size 52x99 starting at (136, 115).
; PLAN: r0=136(x), r1=115(y), r2=52(width), r3=99(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 115
LDI r2, 52
LDI r3, 99
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
