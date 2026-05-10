; DESCRIPTION: Composite: Creates a black circular shape at (107, 138) with radius 44 then Places a black line segment connecting (496, 207) to (259, 131).
; PLAN: r0=107(x), r1=138(y), r2=44(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=496(x1), r6=207(y1), r7=259(x2), r8=131(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 107
LDI r1, 138
LDI r2, 44
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 496
LDI r6, 207
LDI r7, 259
LDI r8, 131
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
