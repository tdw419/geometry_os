; DESCRIPTION: Composite: Draws a orange circle centered at (346, 72) with radius 31 then Places a green dot at position (266, 75) then Places a cyan line segment connecting (347, 133) to (54, 171).
; PLAN: r0=346(x), r1=72(y), r2=31(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=266(x), r6=75(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=347(x1), r11=133(y1), r12=54(x2), r13=171(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 346
LDI r1, 72
LDI r2, 31
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 266
LDI r6, 75
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 347
LDI r11, 133
LDI r12, 54
LDI r13, 171
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
