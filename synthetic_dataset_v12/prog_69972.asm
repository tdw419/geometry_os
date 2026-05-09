; DESCRIPTION: Places a magenta 34x102 rectangle at position (471, 3).
; PLAN: r0=471(x), r1=3(y), r2=34(width), r3=102(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 3
LDI r2, 34
LDI r3, 102
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
