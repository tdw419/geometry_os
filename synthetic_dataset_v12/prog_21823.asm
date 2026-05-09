; DESCRIPTION: Composite: Places a orange dot at position (475, 194) then Places a white circle of radius 20 at center (121, 188) then Draws a black line from (164, 182) to (451, 117).
; PLAN: r0=475(x), r1=194(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=121(x), r6=188(y), r7=20(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=164(x1), r11=182(y1), r12=451(x2), r13=117(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 475
LDI r1, 194
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 121
LDI r6, 188
LDI r7, 20
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 164
LDI r11, 182
LDI r12, 451
LDI r13, 117
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
