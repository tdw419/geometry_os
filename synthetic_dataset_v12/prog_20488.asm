; DESCRIPTION: Places a magenta 52x66 rectangle at position (25, 106).
; PLAN: r0=25(x), r1=106(y), r2=52(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 106
LDI r2, 52
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
