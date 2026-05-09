; DESCRIPTION: Places a magenta 117x78 rectangle at position (312, 126).
; PLAN: r0=312(x), r1=126(y), r2=117(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 126
LDI r2, 117
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
