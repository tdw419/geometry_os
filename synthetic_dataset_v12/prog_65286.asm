; DESCRIPTION: Composite: Draws a red line from (493, 204) to (140, 116) then Places a white dot at position (414, 182) then Places a orange circle of radius 48 at center (313, 165).
; PLAN: r0=493(x1), r1=204(y1), r2=140(x2), r3=116(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=414(x), r6=182(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=313(x), r11=165(y), r12=48(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 493
LDI r1, 204
LDI r2, 140
LDI r3, 116
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 414
LDI r6, 182
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 313
LDI r11, 165
LDI r12, 48
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
