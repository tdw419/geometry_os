; DESCRIPTION: Places a magenta 85x106 rectangle at position (335, 94).
; PLAN: r0=335(x), r1=94(y), r2=85(width), r3=106(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 94
LDI r2, 85
LDI r3, 106
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
