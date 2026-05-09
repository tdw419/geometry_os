; DESCRIPTION: Places a magenta 88x96 rectangle at position (312, 13).
; PLAN: r0=312(x), r1=13(y), r2=88(width), r3=96(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 13
LDI r2, 88
LDI r3, 96
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
