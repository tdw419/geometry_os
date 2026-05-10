; DESCRIPTION: Composite: Draws a orange line from (69, 109) to (43, 182) then Creates a magenta rectangular region at (237, 151) spanning 33 by 48 pixels.
; PLAN: r0=69(x1), r1=109(y1), r2=43(x2), r3=182(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=237(x), r6=151(y), r7=33(width), r8=48(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 69
LDI r1, 109
LDI r2, 43
LDI r3, 182
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 237
LDI r6, 151
LDI r7, 33
LDI r8, 48
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
