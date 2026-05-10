; DESCRIPTION: Composite: Sets a single yellow pixel at (494, 207) then Renders a white line between points (228, 27) and (13, 29) then Creates a white circular shape at (362, 155) with radius 36.
; PLAN: r0=494(x), r1=207(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=228(x1), r6=27(y1), r7=13(x2), r8=29(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=362(x), r11=155(y), r12=36(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 494
LDI r1, 207
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 228
LDI r6, 27
LDI r7, 13
LDI r8, 29
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 362
LDI r11, 155
LDI r12, 36
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
