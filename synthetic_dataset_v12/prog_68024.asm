; DESCRIPTION: Composite: Draws a yellow circle centered at (193, 100) with radius 60 then Places a magenta line segment connecting (290, 181) to (85, 193).
; PLAN: r0=193(x), r1=100(y), r2=60(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=290(x1), r6=181(y1), r7=85(x2), r8=193(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 193
LDI r1, 100
LDI r2, 60
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 290
LDI r6, 181
LDI r7, 85
LDI r8, 193
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
