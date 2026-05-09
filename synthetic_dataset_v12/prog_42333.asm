; DESCRIPTION: Places a magenta 10x101 rectangle at position (183, 72).
; PLAN: r0=183(x), r1=72(y), r2=10(width), r3=101(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 72
LDI r2, 10
LDI r3, 101
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
