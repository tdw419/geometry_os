; DESCRIPTION: Renders a green box of size 82x78 starting at (423, 105).
; PLAN: r0=423(x), r1=105(y), r2=82(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 105
LDI r2, 82
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
