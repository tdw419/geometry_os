; DESCRIPTION: Composite: Draws a green circle centered at (305, 153) with radius 11 then Places a orange dot at position (327, 19) then Draws a black line from (13, 37) to (106, 251).
; PLAN: r0=305(x), r1=153(y), r2=11(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=327(x), r6=19(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=13(x1), r11=37(y1), r12=106(x2), r13=251(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 305
LDI r1, 153
LDI r2, 11
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 327
LDI r6, 19
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 13
LDI r11, 37
LDI r12, 106
LDI r13, 251
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
