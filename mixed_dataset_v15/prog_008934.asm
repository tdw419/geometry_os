; DESCRIPTION: Composite: Renders a yellow disk with center (200, 90) and radius 68 then Renders a red line between points (199, 59) and (7, 62) then Sets a single black pixel at (445, 129).
; PLAN: r0=200(x), r1=90(y), r2=68(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=199(x1), r6=59(y1), r7=7(x2), r8=62(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=445(x), r11=129(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 200
LDI r1, 90
LDI r2, 68
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 199
LDI r6, 59
LDI r7, 7
LDI r8, 62
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 445
LDI r11, 129
LDI r12, 0x000000
PSET r10, r11, r12
HALT
