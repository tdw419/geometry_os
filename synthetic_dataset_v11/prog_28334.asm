; DESCRIPTION: Places a magenta 85x45 rectangle at position (132, 130).
; PLAN: r0=132(x), r1=130(y), r2=85(width), r3=45(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 130
LDI r2, 85
LDI r3, 45
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
