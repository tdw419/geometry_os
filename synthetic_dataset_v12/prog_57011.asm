; DESCRIPTION: Composite: Draws a magenta line from (187, 165) to (62, 3) then Draws a green circle centered at (399, 87) with radius 63.
; PLAN: r0=187(x1), r1=165(y1), r2=62(x2), r3=3(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=399(x), r6=87(y), r7=63(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 187
LDI r1, 165
LDI r2, 62
LDI r3, 3
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 399
LDI r6, 87
LDI r7, 63
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
