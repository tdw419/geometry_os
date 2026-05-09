; DESCRIPTION: Composite: Sets a single yellow pixel at (167, 80) then Draws a cyan line from (274, 204) to (267, 148) then Draws a red circle centered at (174, 36) with radius 14.
; PLAN: r0=167(x), r1=80(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=274(x1), r6=204(y1), r7=267(x2), r8=148(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=174(x), r11=36(y), r12=14(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 167
LDI r1, 80
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 274
LDI r6, 204
LDI r7, 267
LDI r8, 148
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 174
LDI r11, 36
LDI r12, 14
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
