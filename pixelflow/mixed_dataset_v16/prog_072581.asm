; DESCRIPTION: Composite: Draws a yellow circle centered at (341, 32) with radius 32 then Places a white line segment connecting (359, 208) to (413, 70).
; PLAN: r0=341(x), r1=32(y), r2=32(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=359(x1), r6=208(y1), r7=413(x2), r8=70(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 341
LDI r1, 32
LDI r2, 32
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 359
LDI r6, 208
LDI r7, 413
LDI r8, 70
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
