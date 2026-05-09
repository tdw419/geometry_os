; DESCRIPTION: Places a magenta 85x15 rectangle at position (188, 185).
; PLAN: r0=188(x), r1=185(y), r2=85(width), r3=15(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 185
LDI r2, 85
LDI r3, 15
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
