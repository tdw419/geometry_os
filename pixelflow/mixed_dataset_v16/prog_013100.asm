; DESCRIPTION: Composite: Places a yellow circle of radius 45 at center (442, 194) then Places a green line segment connecting (316, 165) to (25, 195).
; PLAN: r0=442(x), r1=194(y), r2=45(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=316(x1), r6=165(y1), r7=25(x2), r8=195(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 442
LDI r1, 194
LDI r2, 45
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 316
LDI r6, 165
LDI r7, 25
LDI r8, 195
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
