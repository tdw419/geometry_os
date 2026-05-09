; DESCRIPTION: Composite: Places a magenta line segment connecting (69, 253) to (155, 81) then Creates a orange rectangular region at (184, 101) spanning 75 by 90 pixels.
; PLAN: r0=69(x1), r1=253(y1), r2=155(x2), r3=81(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=184(x), r6=101(y), r7=75(width), r8=90(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 69
LDI r1, 253
LDI r2, 155
LDI r3, 81
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 184
LDI r6, 101
LDI r7, 75
LDI r8, 90
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
