; DESCRIPTION: Composite: Renders a purple line between points (381, 254) and (314, 211) then Places a purple circle of radius 61 at center (154, 113).
; PLAN: r0=381(x1), r1=254(y1), r2=314(x2), r3=211(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=154(x), r6=113(y), r7=61(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 381
LDI r1, 254
LDI r2, 314
LDI r3, 211
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 154
LDI r6, 113
LDI r7, 61
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
