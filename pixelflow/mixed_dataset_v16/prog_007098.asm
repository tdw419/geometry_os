; DESCRIPTION: Composite: Places a white dot at position (246, 60) then Creates a orange circular shape at (357, 164) with radius 27 then Renders a orange line between points (134, 141) and (101, 59).
; PLAN: r0=246(x), r1=60(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=357(x), r6=164(y), r7=27(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=134(x1), r11=141(y1), r12=101(x2), r13=59(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 246
LDI r1, 60
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 357
LDI r6, 164
LDI r7, 27
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 134
LDI r11, 141
LDI r12, 101
LDI r13, 59
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
