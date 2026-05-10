; DESCRIPTION: Places a purple 36x106 rectangle at position (472, 7).
; PLAN: r0=472(x), r1=7(y), r2=36(width), r3=106(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 7
LDI r2, 36
LDI r3, 106
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
