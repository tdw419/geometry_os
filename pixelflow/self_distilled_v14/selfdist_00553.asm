; DESCRIPTION: Places a magenta 24x54 box at position (106, 5).
; PLAN: r0=106(x), r1=5(y), r2=24(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 5
LDI r2, 24
LDI r3, 54
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
