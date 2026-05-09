; DESCRIPTION: Renders a purple box of size 57x69 starting at (164, 116).
; PLAN: r0=164(x), r1=116(y), r2=57(width), r3=69(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 116
LDI r2, 57
LDI r3, 69
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
