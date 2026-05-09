; DESCRIPTION: Composite: Draws a green circle centered at (134, 104) with radius 68 then Places a black line segment connecting (122, 226) to (299, 223).
; PLAN: r0=134(x), r1=104(y), r2=68(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=122(x1), r6=226(y1), r7=299(x2), r8=223(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 134
LDI r1, 104
LDI r2, 68
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 122
LDI r6, 226
LDI r7, 299
LDI r8, 223
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
