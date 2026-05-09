; DESCRIPTION: Composite: Sets a single red pixel at (58, 205) then Draws a black line from (2, 81) to (496, 242) then Places a green 72x69 rectangle at position (185, 4).
; PLAN: r0=58(x), r1=205(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=2(x1), r6=81(y1), r7=496(x2), r8=242(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=185(x), r11=4(y), r12=72(width), r13=69(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 58
LDI r1, 205
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 2
LDI r6, 81
LDI r7, 496
LDI r8, 242
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 185
LDI r11, 4
LDI r12, 72
LDI r13, 69
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
