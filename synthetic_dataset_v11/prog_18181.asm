; DESCRIPTION: Places a magenta 18x100 rectangle at position (14, 110).
; PLAN: r0=14(x), r1=110(y), r2=18(width), r3=100(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 110
LDI r2, 18
LDI r3, 100
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
