; DESCRIPTION: Composite: Places a yellow dot at position (59, 1) then Places a cyan line segment connecting (89, 174) to (130, 12) then Places a orange circle of radius 77 at center (355, 115).
; PLAN: r0=59(x), r1=1(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=89(x1), r6=174(y1), r7=130(x2), r8=12(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=355(x), r11=115(y), r12=77(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 59
LDI r1, 1
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 89
LDI r6, 174
LDI r7, 130
LDI r8, 12
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 355
LDI r11, 115
LDI r12, 77
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
