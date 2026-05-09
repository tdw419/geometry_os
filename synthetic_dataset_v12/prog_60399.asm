; DESCRIPTION: Places a magenta 59x118 rectangle at position (132, 90).
; PLAN: r0=132(x), r1=90(y), r2=59(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 90
LDI r2, 59
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
