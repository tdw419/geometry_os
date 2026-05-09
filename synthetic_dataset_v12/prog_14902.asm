; DESCRIPTION: Composite: Sets a single white pixel at (365, 204) then Draws a purple line from (45, 130) to (480, 31) then Renders a white disk with center (342, 104) and radius 67.
; PLAN: r0=365(x), r1=204(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=45(x1), r6=130(y1), r7=480(x2), r8=31(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=342(x), r11=104(y), r12=67(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 365
LDI r1, 204
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 45
LDI r6, 130
LDI r7, 480
LDI r8, 31
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 342
LDI r11, 104
LDI r12, 67
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
