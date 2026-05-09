; DESCRIPTION: Composite: Places a magenta line segment connecting (205, 92) to (197, 125) then Creates a black circular shape at (433, 133) with radius 21.
; PLAN: r0=205(x1), r1=92(y1), r2=197(x2), r3=125(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=433(x), r6=133(y), r7=21(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 205
LDI r1, 92
LDI r2, 197
LDI r3, 125
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 433
LDI r6, 133
LDI r7, 21
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
