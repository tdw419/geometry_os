; DESCRIPTION: Places a magenta 92x97 rectangle at position (133, 101).
; PLAN: r0=133(x), r1=101(y), r2=92(width), r3=97(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 101
LDI r2, 92
LDI r3, 97
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
