; DESCRIPTION: Renders a blue box of size 68x71 starting at (145, 121).
; PLAN: r0=145(x), r1=121(y), r2=68(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 121
LDI r2, 68
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
