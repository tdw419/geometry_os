; DESCRIPTION: Places a magenta 65x104 rectangle at position (99, 97).
; PLAN: r0=99(x), r1=97(y), r2=65(width), r3=104(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 97
LDI r2, 65
LDI r3, 104
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
