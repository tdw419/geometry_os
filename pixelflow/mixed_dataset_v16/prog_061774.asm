; DESCRIPTION: Renders a purple box of size 70x69 starting at (121, 79).
; PLAN: r0=121(x), r1=79(y), r2=70(width), r3=69(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 79
LDI r2, 70
LDI r3, 69
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
