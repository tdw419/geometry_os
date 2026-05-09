; DESCRIPTION: Places a yellow 67x81 rectangle at position (312, 116).
; PLAN: r0=312(x), r1=116(y), r2=67(width), r3=81(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 116
LDI r2, 67
LDI r3, 81
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
