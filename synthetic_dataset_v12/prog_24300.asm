; DESCRIPTION: Composite: Draws a purple circle centered at (252, 84) with radius 61 then Draws a magenta line from (169, 85) to (275, 16).
; PLAN: r0=252(x), r1=84(y), r2=61(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=169(x1), r6=85(y1), r7=275(x2), r8=16(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 252
LDI r1, 84
LDI r2, 61
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 169
LDI r6, 85
LDI r7, 275
LDI r8, 16
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
