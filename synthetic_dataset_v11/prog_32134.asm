; DESCRIPTION: Renders a purple box of size 118x80 starting at (100, 92).
; PLAN: r0=100(x), r1=92(y), r2=118(width), r3=80(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 92
LDI r2, 118
LDI r3, 80
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
