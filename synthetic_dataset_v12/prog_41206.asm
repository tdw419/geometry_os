; DESCRIPTION: Places a magenta 100x54 rectangle at position (285, 97).
; PLAN: r0=285(x), r1=97(y), r2=100(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 97
LDI r2, 100
LDI r3, 54
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
