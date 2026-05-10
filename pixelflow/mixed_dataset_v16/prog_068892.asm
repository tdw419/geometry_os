; DESCRIPTION: Renders a blue box of size 109x65 starting at (98, 33).
; PLAN: r0=98(x), r1=33(y), r2=109(width), r3=65(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 33
LDI r2, 109
LDI r3, 65
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
