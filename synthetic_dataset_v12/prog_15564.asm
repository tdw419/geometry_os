; DESCRIPTION: Composite: Renders a white disk with center (338, 125) and radius 19 then Places a orange dot at position (494, 15) then Draws a magenta line from (181, 1) to (368, 13).
; PLAN: r0=338(x), r1=125(y), r2=19(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=494(x), r6=15(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=181(x1), r11=1(y1), r12=368(x2), r13=13(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 338
LDI r1, 125
LDI r2, 19
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 494
LDI r6, 15
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 181
LDI r11, 1
LDI r12, 368
LDI r13, 13
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
