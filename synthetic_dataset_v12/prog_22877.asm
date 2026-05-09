; DESCRIPTION: Places a purple 116x106 rectangle at position (73, 74).
; PLAN: r0=73(x), r1=74(y), r2=116(width), r3=106(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 74
LDI r2, 116
LDI r3, 106
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
