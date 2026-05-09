; DESCRIPTION: Composite: Sets a single cyan pixel at (373, 18) then Places a yellow line segment connecting (400, 159) to (68, 35) then Draws a cyan circle centered at (240, 138) with radius 18.
; PLAN: r0=373(x), r1=18(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=400(x1), r6=159(y1), r7=68(x2), r8=35(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=240(x), r11=138(y), r12=18(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 373
LDI r1, 18
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 400
LDI r6, 159
LDI r7, 68
LDI r8, 35
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 240
LDI r11, 138
LDI r12, 18
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
