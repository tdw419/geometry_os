; DESCRIPTION: Renders a purple rectangular region spanning 95 by 108 at (258, 81).
; PLAN: r0=258(x), r1=81(y), r2=95(width), r3=108(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 81
LDI r2, 95
LDI r3, 108
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
