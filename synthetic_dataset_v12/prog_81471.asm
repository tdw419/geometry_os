; DESCRIPTION: Composite: Renders a black disk with center (295, 191) and radius 56 then Places a black dot at position (141, 154) then Places a cyan line segment connecting (120, 225) to (290, 106).
; PLAN: r0=295(x), r1=191(y), r2=56(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=141(x), r6=154(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=120(x1), r11=225(y1), r12=290(x2), r13=106(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 295
LDI r1, 191
LDI r2, 56
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 141
LDI r6, 154
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 120
LDI r11, 225
LDI r12, 290
LDI r13, 106
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
