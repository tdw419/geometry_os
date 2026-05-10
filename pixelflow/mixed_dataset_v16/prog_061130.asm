; DESCRIPTION: Composite: Places a green line segment connecting (28, 136) to (266, 208) then Draws a yellow circle centered at (202, 140) with radius 79.
; PLAN: r0=28(x1), r1=136(y1), r2=266(x2), r3=208(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=202(x), r6=140(y), r7=79(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 28
LDI r1, 136
LDI r2, 266
LDI r3, 208
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 202
LDI r6, 140
LDI r7, 79
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
