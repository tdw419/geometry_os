; DESCRIPTION: Renders a green box of size 35x97 starting at (172, 18).
; PLAN: r0=172(x), r1=18(y), r2=35(width), r3=97(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 18
LDI r2, 35
LDI r3, 97
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
