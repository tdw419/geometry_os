; DESCRIPTION: Composite: Draws a yellow line from (117, 8) to (501, 223) then Sets a single white pixel at (151, 107) then Places a yellow circle of radius 40 at center (408, 91).
; PLAN: r0=117(x1), r1=8(y1), r2=501(x2), r3=223(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=151(x), r6=107(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=408(x), r11=91(y), r12=40(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 117
LDI r1, 8
LDI r2, 501
LDI r3, 223
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 151
LDI r6, 107
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 408
LDI r11, 91
LDI r12, 40
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
