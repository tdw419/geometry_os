; DESCRIPTION: Renders a purple box of size 117x91 starting at (205, 119).
; PLAN: r0=205(x), r1=119(y), r2=117(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 119
LDI r2, 117
LDI r3, 91
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
