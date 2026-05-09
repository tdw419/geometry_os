; DESCRIPTION: Renders a purple box of size 58x48 starting at (22, 67).
; PLAN: r0=22(x), r1=67(y), r2=58(width), r3=48(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 67
LDI r2, 58
LDI r3, 48
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
