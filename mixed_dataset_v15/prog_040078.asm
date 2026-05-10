; DESCRIPTION: Composite: Places a orange dot at position (436, 208) then Renders a purple disk with center (258, 165) and radius 47 then Places a white line segment connecting (441, 139) to (71, 23).
; PLAN: r0=436(x), r1=208(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=258(x), r6=165(y), r7=47(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=441(x1), r11=139(y1), r12=71(x2), r13=23(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 436
LDI r1, 208
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 258
LDI r6, 165
LDI r7, 47
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 441
LDI r11, 139
LDI r12, 71
LDI r13, 23
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
