; DESCRIPTION: Places a purple 26x117 rectangle at position (88, 34).
; PLAN: r0=88(x), r1=34(y), r2=26(width), r3=117(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 34
LDI r2, 26
LDI r3, 117
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
