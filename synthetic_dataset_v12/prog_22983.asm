; DESCRIPTION: Composite: Places a white dot at position (399, 214) then Renders a purple disk with center (394, 44) and radius 39 then Draws a orange line from (369, 250) to (498, 112).
; PLAN: r0=399(x), r1=214(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=394(x), r6=44(y), r7=39(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=369(x1), r11=250(y1), r12=498(x2), r13=112(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 399
LDI r1, 214
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 394
LDI r6, 44
LDI r7, 39
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 369
LDI r11, 250
LDI r12, 498
LDI r13, 112
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
