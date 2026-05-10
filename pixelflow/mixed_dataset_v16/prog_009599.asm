; DESCRIPTION: Places a magenta 106x110 rectangle at position (208, 0).
; PLAN: r0=208(x), r1=0(y), r2=106(width), r3=110(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 0
LDI r2, 106
LDI r3, 110
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
