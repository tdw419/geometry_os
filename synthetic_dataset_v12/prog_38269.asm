; DESCRIPTION: Composite: Draws a blue line from (349, 126) to (124, 35) then Places a black dot at position (244, 41) then Creates a cyan circular shape at (280, 59) with radius 51.
; PLAN: r0=349(x1), r1=126(y1), r2=124(x2), r3=35(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=244(x), r6=41(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=280(x), r11=59(y), r12=51(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 349
LDI r1, 126
LDI r2, 124
LDI r3, 35
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 244
LDI r6, 41
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 280
LDI r11, 59
LDI r12, 51
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
