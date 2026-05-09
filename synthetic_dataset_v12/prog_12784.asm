; DESCRIPTION: Composite: Places a white dot at position (486, 37) then Renders a green disk with center (422, 70) and radius 45 then Places a purple line segment connecting (437, 90) to (280, 209).
; PLAN: r0=486(x), r1=37(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=422(x), r6=70(y), r7=45(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=437(x1), r11=90(y1), r12=280(x2), r13=209(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 486
LDI r1, 37
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 422
LDI r6, 70
LDI r7, 45
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 437
LDI r11, 90
LDI r12, 280
LDI r13, 209
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
