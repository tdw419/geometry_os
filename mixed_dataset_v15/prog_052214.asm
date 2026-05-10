; DESCRIPTION: Composite: Draws a cyan line from (331, 117) to (283, 248) then Places a yellow dot at position (405, 114) then Renders a white disk with center (212, 144) and radius 77.
; PLAN: r0=331(x1), r1=117(y1), r2=283(x2), r3=248(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=405(x), r6=114(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=212(x), r11=144(y), r12=77(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 331
LDI r1, 117
LDI r2, 283
LDI r3, 248
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 405
LDI r6, 114
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 212
LDI r11, 144
LDI r12, 77
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
