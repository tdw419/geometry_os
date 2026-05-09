; DESCRIPTION: Composite: Draws a white circle centered at (245, 113) with radius 15 then Draws a purple line from (81, 240) to (167, 181) then Sets a single red pixel at (240, 91).
; PLAN: r0=245(x), r1=113(y), r2=15(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=81(x1), r6=240(y1), r7=167(x2), r8=181(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=240(x), r11=91(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 245
LDI r1, 113
LDI r2, 15
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 81
LDI r6, 240
LDI r7, 167
LDI r8, 181
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 240
LDI r11, 91
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
