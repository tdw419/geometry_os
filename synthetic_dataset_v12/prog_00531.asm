; DESCRIPTION: Composite: Sets a single black pixel at (12, 166) then Renders a orange line between points (264, 111) and (457, 242) then Creates a orange circular shape at (343, 57) with radius 50.
; PLAN: r0=12(x), r1=166(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=264(x1), r6=111(y1), r7=457(x2), r8=242(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=343(x), r11=57(y), r12=50(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 12
LDI r1, 166
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 264
LDI r6, 111
LDI r7, 457
LDI r8, 242
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 343
LDI r11, 57
LDI r12, 50
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
