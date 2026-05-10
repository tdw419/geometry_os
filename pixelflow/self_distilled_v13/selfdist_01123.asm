; DESCRIPTION: Places a magenta 91x110 box at position (47, 79).
; PLAN: r0=47(x), r1=79(y), r2=91(width), r3=110(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 79
LDI r2, 91
LDI r3, 110
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
