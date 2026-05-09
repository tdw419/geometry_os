; DESCRIPTION: Places a purple 81x43 rectangle at position (315, 106).
; PLAN: r0=315(x), r1=106(y), r2=81(width), r3=43(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 106
LDI r2, 81
LDI r3, 43
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
