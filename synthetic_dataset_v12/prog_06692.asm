; DESCRIPTION: Places a magenta 44x57 rectangle at position (133, 181).
; PLAN: r0=133(x), r1=181(y), r2=44(width), r3=57(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 181
LDI r2, 44
LDI r3, 57
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
