; DESCRIPTION: Composite: Sets a single white pixel at (72, 132) then Renders a white line between points (487, 158) and (225, 20) then Places a cyan circle of radius 78 at center (93, 140).
; PLAN: r0=72(x), r1=132(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=487(x1), r6=158(y1), r7=225(x2), r8=20(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=93(x), r11=140(y), r12=78(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 72
LDI r1, 132
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 487
LDI r6, 158
LDI r7, 225
LDI r8, 20
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 93
LDI r11, 140
LDI r12, 78
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
