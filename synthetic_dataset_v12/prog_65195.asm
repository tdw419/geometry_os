; DESCRIPTION: Places a magenta 118x62 rectangle at position (312, 165).
; PLAN: r0=312(x), r1=165(y), r2=118(width), r3=62(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 165
LDI r2, 118
LDI r3, 62
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
