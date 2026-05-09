; DESCRIPTION: Composite: Sets a single red pixel at (246, 247) then Creates a white circular shape at (266, 74) with radius 19 then Draws a red line from (310, 129) to (176, 7).
; PLAN: r0=246(x), r1=247(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=266(x), r6=74(y), r7=19(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=310(x1), r11=129(y1), r12=176(x2), r13=7(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 246
LDI r1, 247
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 266
LDI r6, 74
LDI r7, 19
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 310
LDI r11, 129
LDI r12, 176
LDI r13, 7
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
