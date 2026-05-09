; DESCRIPTION: Places a magenta 28x92 rectangle at position (155, 158).
; PLAN: r0=155(x), r1=158(y), r2=28(width), r3=92(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 158
LDI r2, 28
LDI r3, 92
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
