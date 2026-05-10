; DESCRIPTION: Composite: Places a yellow line segment connecting (411, 210) to (132, 58) then Creates a red circular shape at (371, 80) with radius 53.
; PLAN: r0=411(x1), r1=210(y1), r2=132(x2), r3=58(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=371(x), r6=80(y), r7=53(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 411
LDI r1, 210
LDI r2, 132
LDI r3, 58
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 371
LDI r6, 80
LDI r7, 53
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
