; DESCRIPTION: Composite: Places a white dot at position (404, 40) then Places a orange circle of radius 20 at center (24, 174) then Renders a magenta line between points (11, 209) and (49, 106).
; PLAN: r0=404(x), r1=40(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=24(x), r6=174(y), r7=20(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=11(x1), r11=209(y1), r12=49(x2), r13=106(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 404
LDI r1, 40
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 24
LDI r6, 174
LDI r7, 20
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 11
LDI r11, 209
LDI r12, 49
LDI r13, 106
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
