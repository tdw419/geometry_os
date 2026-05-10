; DESCRIPTION: Places a magenta 88x61 rectangle at position (34, 137).
; PLAN: r0=34(x), r1=137(y), r2=88(width), r3=61(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 137
LDI r2, 88
LDI r3, 61
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
