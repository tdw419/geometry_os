; DESCRIPTION: Composite: Creates a yellow circular shape at (164, 116) with radius 67 then Draws a white line from (455, 131) to (314, 22) then Places a white dot at position (11, 144).
; PLAN: r0=164(x), r1=116(y), r2=67(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=455(x1), r6=131(y1), r7=314(x2), r8=22(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=11(x), r11=144(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 164
LDI r1, 116
LDI r2, 67
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 455
LDI r6, 131
LDI r7, 314
LDI r8, 22
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 11
LDI r11, 144
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
