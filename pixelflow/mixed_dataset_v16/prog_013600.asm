; DESCRIPTION: Composite: Creates a yellow circular shape at (459, 46) with radius 36 then Places a purple line segment connecting (324, 249) to (305, 200).
; PLAN: r0=459(x), r1=46(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=324(x1), r6=249(y1), r7=305(x2), r8=200(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 459
LDI r1, 46
LDI r2, 36
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 324
LDI r6, 249
LDI r7, 305
LDI r8, 200
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
