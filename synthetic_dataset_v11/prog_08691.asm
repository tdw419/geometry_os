; DESCRIPTION: Renders a purple box of size 31x91 starting at (120, 58).
; PLAN: r0=120(x), r1=58(y), r2=31(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 58
LDI r2, 31
LDI r3, 91
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
