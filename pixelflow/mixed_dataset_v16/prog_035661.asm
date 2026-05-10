; DESCRIPTION: Composite: Creates a green circular shape at (452, 99) with radius 17 then Places a green line segment connecting (428, 244) to (497, 243).
; PLAN: r0=452(x), r1=99(y), r2=17(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=428(x1), r6=244(y1), r7=497(x2), r8=243(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 452
LDI r1, 99
LDI r2, 17
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 428
LDI r6, 244
LDI r7, 497
LDI r8, 243
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
