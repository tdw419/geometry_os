; DESCRIPTION: Composite: Creates a green circular shape at (411, 129) with radius 70 then Places a blue line segment connecting (278, 25) to (237, 70).
; PLAN: r0=411(x), r1=129(y), r2=70(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=278(x1), r6=25(y1), r7=237(x2), r8=70(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 411
LDI r1, 129
LDI r2, 70
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 278
LDI r6, 25
LDI r7, 237
LDI r8, 70
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
