; DESCRIPTION: Composite: Renders a red disk with center (342, 108) and radius 19 then Sets a single green pixel at (19, 250) then Draws a white line from (34, 43) to (275, 5).
; PLAN: r0=342(x), r1=108(y), r2=19(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=19(x), r6=250(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=34(x1), r11=43(y1), r12=275(x2), r13=5(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 342
LDI r1, 108
LDI r2, 19
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 19
LDI r6, 250
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 34
LDI r11, 43
LDI r12, 275
LDI r13, 5
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
