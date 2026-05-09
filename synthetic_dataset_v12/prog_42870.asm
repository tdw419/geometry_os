; DESCRIPTION: Renders a purple box of size 85x92 starting at (225, 92).
; PLAN: r0=225(x), r1=92(y), r2=85(width), r3=92(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 92
LDI r2, 85
LDI r3, 92
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
