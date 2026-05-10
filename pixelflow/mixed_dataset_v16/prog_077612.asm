; DESCRIPTION: Composite: Draws a orange circle centered at (169, 174) with radius 46 then Renders a black line between points (278, 79) and (406, 174).
; PLAN: r0=169(x), r1=174(y), r2=46(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=278(x1), r6=79(y1), r7=406(x2), r8=174(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 169
LDI r1, 174
LDI r2, 46
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 278
LDI r6, 79
LDI r7, 406
LDI r8, 174
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
