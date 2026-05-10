; DESCRIPTION: Composite: Renders a green disk with center (116, 198) and radius 12 then Places a magenta line segment connecting (416, 234) to (174, 172) then Sets a single orange pixel at (293, 233).
; PLAN: r0=116(x), r1=198(y), r2=12(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=416(x1), r6=234(y1), r7=174(x2), r8=172(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=293(x), r11=233(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 116
LDI r1, 198
LDI r2, 12
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 416
LDI r6, 234
LDI r7, 174
LDI r8, 172
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 293
LDI r11, 233
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
