; DESCRIPTION: Places a purple 97x114 rectangle at position (116, 88).
; PLAN: r0=116(x), r1=88(y), r2=97(width), r3=114(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 88
LDI r2, 97
LDI r3, 114
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
