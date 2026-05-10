; DESCRIPTION: Places a magenta 34x37 rectangle at position (312, 196).
; PLAN: r0=312(x), r1=196(y), r2=34(width), r3=37(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 196
LDI r2, 34
LDI r3, 37
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
