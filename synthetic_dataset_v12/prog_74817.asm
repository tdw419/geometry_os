; DESCRIPTION: Renders a purple box of size 83x69 starting at (142, 92).
; PLAN: r0=142(x), r1=92(y), r2=83(width), r3=69(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 92
LDI r2, 83
LDI r3, 69
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
