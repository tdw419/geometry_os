; DESCRIPTION: Renders a blue rectangular region spanning 30 by 116 at (383, 141).
; PLAN: r0=383(x), r1=141(y), r2=30(width), r3=116(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 141
LDI r2, 30
LDI r3, 116
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
