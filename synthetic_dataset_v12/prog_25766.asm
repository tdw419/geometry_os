; DESCRIPTION: Places a magenta 83x34 rectangle at position (133, 101).
; PLAN: r0=133(x), r1=101(y), r2=83(width), r3=34(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 101
LDI r2, 83
LDI r3, 34
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
