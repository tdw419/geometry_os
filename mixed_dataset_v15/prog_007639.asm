; DESCRIPTION: Places a magenta 85x23 box at position (191, 47).
; PLAN: r0=191(x), r1=47(y), r2=85(width), r3=23(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 47
LDI r2, 85
LDI r3, 23
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
