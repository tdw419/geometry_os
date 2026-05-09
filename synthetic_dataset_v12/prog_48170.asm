; DESCRIPTION: Composite: Places a blue line segment connecting (107, 88) to (145, 32) then Creates a black circular shape at (277, 84) with radius 57.
; PLAN: r0=107(x1), r1=88(y1), r2=145(x2), r3=32(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=277(x), r6=84(y), r7=57(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 107
LDI r1, 88
LDI r2, 145
LDI r3, 32
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 277
LDI r6, 84
LDI r7, 57
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
