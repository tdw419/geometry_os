; DESCRIPTION: Composite: Places a magenta line segment connecting (23, 161) to (236, 102) then Creates a white circular shape at (438, 103) with radius 25.
; PLAN: r0=23(x1), r1=161(y1), r2=236(x2), r3=102(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=438(x), r6=103(y), r7=25(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 23
LDI r1, 161
LDI r2, 236
LDI r3, 102
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 438
LDI r6, 103
LDI r7, 25
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
