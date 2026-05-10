; DESCRIPTION: Composite: Creates a green circular shape at (71, 196) with radius 29 then Places a blue line segment connecting (230, 53) to (14, 227).
; PLAN: r0=71(x), r1=196(y), r2=29(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=230(x1), r6=53(y1), r7=14(x2), r8=227(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 71
LDI r1, 196
LDI r2, 29
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 230
LDI r6, 53
LDI r7, 14
LDI r8, 227
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
