; DESCRIPTION: Composite: Renders a red line between points (209, 67) and (287, 205) then Places a red circle of radius 33 at center (250, 201).
; PLAN: r0=209(x1), r1=67(y1), r2=287(x2), r3=205(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=250(x), r6=201(y), r7=33(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 209
LDI r1, 67
LDI r2, 287
LDI r3, 205
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 250
LDI r6, 201
LDI r7, 33
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
