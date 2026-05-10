; DESCRIPTION: Places a magenta 30x20 rectangle at position (158, 105).
; PLAN: r0=158(x), r1=105(y), r2=30(width), r3=20(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 105
LDI r2, 30
LDI r3, 20
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
