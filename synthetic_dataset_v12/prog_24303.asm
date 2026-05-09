; DESCRIPTION: Composite: Places a red dot at position (399, 72) then Renders a white line between points (309, 229) and (497, 113) then Places a yellow circle of radius 67 at center (372, 88).
; PLAN: r0=399(x), r1=72(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=309(x1), r6=229(y1), r7=497(x2), r8=113(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=372(x), r11=88(y), r12=67(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 399
LDI r1, 72
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 309
LDI r6, 229
LDI r7, 497
LDI r8, 113
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 372
LDI r11, 88
LDI r12, 67
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
