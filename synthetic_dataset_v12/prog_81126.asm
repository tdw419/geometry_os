; DESCRIPTION: Composite: Places a yellow line segment connecting (141, 74) to (206, 48) then Draws a green circle centered at (308, 90) with radius 40.
; PLAN: r0=141(x1), r1=74(y1), r2=206(x2), r3=48(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=308(x), r6=90(y), r7=40(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 141
LDI r1, 74
LDI r2, 206
LDI r3, 48
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 308
LDI r6, 90
LDI r7, 40
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
