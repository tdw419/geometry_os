; DESCRIPTION: Composite: Places a magenta line segment connecting (96, 68) to (100, 117) then Creates a red circular shape at (282, 140) with radius 24 then Sets a single red pixel at (60, 231).
; PLAN: r0=96(x1), r1=68(y1), r2=100(x2), r3=117(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=282(x), r6=140(y), r7=24(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=60(x), r11=231(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 96
LDI r1, 68
LDI r2, 100
LDI r3, 117
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 282
LDI r6, 140
LDI r7, 24
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 60
LDI r11, 231
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
