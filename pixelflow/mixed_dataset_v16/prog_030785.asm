; DESCRIPTION: Composite: Places a white dot at position (382, 166) then Draws a white line from (399, 25) to (217, 40) then Draws a blue circle centered at (406, 75) with radius 58.
; PLAN: r0=382(x), r1=166(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=399(x1), r6=25(y1), r7=217(x2), r8=40(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=406(x), r11=75(y), r12=58(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 382
LDI r1, 166
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 399
LDI r6, 25
LDI r7, 217
LDI r8, 40
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 406
LDI r11, 75
LDI r12, 58
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
