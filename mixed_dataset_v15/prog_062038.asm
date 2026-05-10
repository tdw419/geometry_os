; DESCRIPTION: Composite: Places a orange circle of radius 17 at center (29, 182) then Places a red dot at position (406, 122) then Places a red line segment connecting (267, 107) to (240, 7).
; PLAN: r0=29(x), r1=182(y), r2=17(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=406(x), r6=122(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=267(x1), r11=107(y1), r12=240(x2), r13=7(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 29
LDI r1, 182
LDI r2, 17
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 406
LDI r6, 122
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 267
LDI r11, 107
LDI r12, 240
LDI r13, 7
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
