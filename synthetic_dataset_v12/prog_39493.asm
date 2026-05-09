; DESCRIPTION: Places a magenta 105x114 rectangle at position (204, 49).
; PLAN: r0=204(x), r1=49(y), r2=105(width), r3=114(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 49
LDI r2, 105
LDI r3, 114
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
