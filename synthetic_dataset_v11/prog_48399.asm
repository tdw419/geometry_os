; DESCRIPTION: Renders a blue box of size 68x69 starting at (124, 90).
; PLAN: r0=124(x), r1=90(y), r2=68(width), r3=69(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 90
LDI r2, 68
LDI r3, 69
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
