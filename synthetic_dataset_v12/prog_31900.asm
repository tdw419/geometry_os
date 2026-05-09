; DESCRIPTION: Composite: Places a green line segment connecting (321, 165) to (142, 72) then Draws a black circle centered at (299, 63) with radius 48.
; PLAN: r0=321(x1), r1=165(y1), r2=142(x2), r3=72(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=299(x), r6=63(y), r7=48(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 321
LDI r1, 165
LDI r2, 142
LDI r3, 72
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 299
LDI r6, 63
LDI r7, 48
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
