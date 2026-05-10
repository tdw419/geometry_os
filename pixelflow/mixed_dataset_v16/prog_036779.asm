; DESCRIPTION: Composite: Renders a black disk with center (452, 193) and radius 39 then Sets a single white pixel at (37, 243) then Renders a white line between points (499, 203) and (261, 236).
; PLAN: r0=452(x), r1=193(y), r2=39(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=37(x), r6=243(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=499(x1), r11=203(y1), r12=261(x2), r13=236(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 452
LDI r1, 193
LDI r2, 39
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 37
LDI r6, 243
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 499
LDI r11, 203
LDI r12, 261
LDI r13, 236
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
