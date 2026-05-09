; DESCRIPTION: Composite: Places a black circle of radius 22 at center (389, 161) then Renders a orange line between points (286, 255) and (318, 14) then Places a orange dot at position (352, 173).
; PLAN: r0=389(x), r1=161(y), r2=22(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=286(x1), r6=255(y1), r7=318(x2), r8=14(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=352(x), r11=173(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 389
LDI r1, 161
LDI r2, 22
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 286
LDI r6, 255
LDI r7, 318
LDI r8, 14
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 352
LDI r11, 173
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
