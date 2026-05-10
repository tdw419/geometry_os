; DESCRIPTION: Composite: Sets a single red pixel at (214, 127) then Draws a orange circle centered at (276, 125) with radius 43 then Places a blue line segment connecting (357, 68) to (370, 168).
; PLAN: r0=214(x), r1=127(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=276(x), r6=125(y), r7=43(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=357(x1), r11=68(y1), r12=370(x2), r13=168(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 214
LDI r1, 127
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 276
LDI r6, 125
LDI r7, 43
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 357
LDI r11, 68
LDI r12, 370
LDI r13, 168
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
