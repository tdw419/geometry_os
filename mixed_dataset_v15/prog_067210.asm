; DESCRIPTION: Places a magenta 116x110 rectangle at position (88, 106).
; PLAN: r0=88(x), r1=106(y), r2=116(width), r3=110(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 106
LDI r2, 116
LDI r3, 110
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
