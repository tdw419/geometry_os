; DESCRIPTION: Places a magenta 119x118 rectangle at position (180, 88).
; PLAN: r0=180(x), r1=88(y), r2=119(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 88
LDI r2, 119
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
