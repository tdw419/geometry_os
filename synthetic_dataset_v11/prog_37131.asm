; DESCRIPTION: Renders a purple box of size 68x108 starting at (140, 116).
; PLAN: r0=140(x), r1=116(y), r2=68(width), r3=108(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 116
LDI r2, 68
LDI r3, 108
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
