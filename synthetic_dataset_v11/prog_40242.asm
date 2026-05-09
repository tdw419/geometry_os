; DESCRIPTION: Places a magenta 92x64 rectangle at position (110, 97).
; PLAN: r0=110(x), r1=97(y), r2=92(width), r3=64(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 97
LDI r2, 92
LDI r3, 64
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
