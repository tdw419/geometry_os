; DESCRIPTION: Composite: Places a green dot at position (347, 214) then Draws a cyan line from (462, 205) to (116, 19) then Draws a yellow circle centered at (53, 174) with radius 21.
; PLAN: r0=347(x), r1=214(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=462(x1), r6=205(y1), r7=116(x2), r8=19(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=53(x), r11=174(y), r12=21(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 347
LDI r1, 214
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 462
LDI r6, 205
LDI r7, 116
LDI r8, 19
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 53
LDI r11, 174
LDI r12, 21
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
