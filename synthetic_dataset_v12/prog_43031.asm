; DESCRIPTION: Composite: Sets a single red pixel at (298, 233) then Places a green line segment connecting (137, 101) to (463, 144) then Draws a red circle centered at (202, 167) with radius 74.
; PLAN: r0=298(x), r1=233(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=137(x1), r6=101(y1), r7=463(x2), r8=144(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=202(x), r11=167(y), r12=74(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 298
LDI r1, 233
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 137
LDI r6, 101
LDI r7, 463
LDI r8, 144
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 202
LDI r11, 167
LDI r12, 74
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
