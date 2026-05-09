; DESCRIPTION: Composite: Sets a single magenta pixel at (151, 253) then Draws a cyan line from (325, 203) to (329, 118) then Places a magenta circle of radius 69 at center (287, 123).
; PLAN: r0=151(x), r1=253(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=325(x1), r6=203(y1), r7=329(x2), r8=118(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=287(x), r11=123(y), r12=69(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 151
LDI r1, 253
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 325
LDI r6, 203
LDI r7, 329
LDI r8, 118
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 287
LDI r11, 123
LDI r12, 69
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
