; DESCRIPTION: Composite: Sets a single green pixel at (91, 237) then Renders a blue disk with center (218, 84) and radius 72 then Draws a orange line from (394, 4) to (499, 9).
; PLAN: r0=91(x), r1=237(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=218(x), r6=84(y), r7=72(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=394(x1), r11=4(y1), r12=499(x2), r13=9(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 91
LDI r1, 237
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 218
LDI r6, 84
LDI r7, 72
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 394
LDI r11, 4
LDI r12, 499
LDI r13, 9
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
