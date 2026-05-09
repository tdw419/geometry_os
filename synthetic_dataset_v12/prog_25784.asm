; DESCRIPTION: Places a magenta 102x29 rectangle at position (181, 179).
; PLAN: r0=181(x), r1=179(y), r2=102(width), r3=29(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 179
LDI r2, 102
LDI r3, 29
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
