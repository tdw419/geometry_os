; DESCRIPTION: Renders a purple box of size 58x120 starting at (416, 69).
; PLAN: r0=416(x), r1=69(y), r2=58(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 69
LDI r2, 58
LDI r3, 120
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
