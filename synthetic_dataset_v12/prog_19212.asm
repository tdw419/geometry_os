; DESCRIPTION: Renders a green box of size 117x112 starting at (125, 105).
; PLAN: r0=125(x), r1=105(y), r2=117(width), r3=112(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 105
LDI r2, 117
LDI r3, 112
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
