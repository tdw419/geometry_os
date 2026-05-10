; DESCRIPTION: Composite: Places a red dot at position (497, 233) then Creates a orange circular shape at (223, 79) with radius 72 then Renders a red line between points (160, 6) and (160, 146).
; PLAN: r0=497(x), r1=233(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=223(x), r6=79(y), r7=72(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=160(x1), r11=6(y1), r12=160(x2), r13=146(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 497
LDI r1, 233
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 223
LDI r6, 79
LDI r7, 72
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 160
LDI r11, 6
LDI r12, 160
LDI r13, 146
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
