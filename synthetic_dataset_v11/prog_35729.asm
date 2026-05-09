; DESCRIPTION: Renders a blue box of size 116x14 starting at (112, 94).
; PLAN: r0=112(x), r1=94(y), r2=116(width), r3=14(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 94
LDI r2, 116
LDI r3, 14
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
