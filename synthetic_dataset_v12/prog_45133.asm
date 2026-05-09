; DESCRIPTION: Composite: Draws a orange circle centered at (241, 181) with radius 71 then Places a orange line segment connecting (421, 255) to (503, 129) then Places a blue dot at position (482, 168).
; PLAN: r0=241(x), r1=181(y), r2=71(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=421(x1), r6=255(y1), r7=503(x2), r8=129(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=482(x), r11=168(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 241
LDI r1, 181
LDI r2, 71
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 421
LDI r6, 255
LDI r7, 503
LDI r8, 129
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 482
LDI r11, 168
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
