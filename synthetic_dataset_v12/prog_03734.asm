; DESCRIPTION: Composite: Places a blue line segment connecting (165, 206) to (184, 211) then Draws a cyan circle centered at (170, 92) with radius 75.
; PLAN: r0=165(x1), r1=206(y1), r2=184(x2), r3=211(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=170(x), r6=92(y), r7=75(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 165
LDI r1, 206
LDI r2, 184
LDI r3, 211
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 170
LDI r6, 92
LDI r7, 75
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
