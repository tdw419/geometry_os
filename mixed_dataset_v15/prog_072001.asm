; DESCRIPTION: Composite: Renders a orange line between points (347, 113) and (69, 146) then Creates a yellow rectangular region at (125, 199) spanning 27 by 55 pixels.
; PLAN: r0=347(x1), r1=113(y1), r2=69(x2), r3=146(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=125(x), r6=199(y), r7=27(width), r8=55(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 347
LDI r1, 113
LDI r2, 69
LDI r3, 146
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 125
LDI r6, 199
LDI r7, 27
LDI r8, 55
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
