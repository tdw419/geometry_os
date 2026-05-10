; DESCRIPTION: Composite: Renders a white disk with center (128, 84) and radius 40 then Places a magenta line segment connecting (152, 212) to (217, 192) then Sets a single red pixel at (129, 202).
; PLAN: r0=128(x), r1=84(y), r2=40(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=152(x1), r6=212(y1), r7=217(x2), r8=192(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=129(x), r11=202(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 128
LDI r1, 84
LDI r2, 40
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 152
LDI r6, 212
LDI r7, 217
LDI r8, 192
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 129
LDI r11, 202
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
