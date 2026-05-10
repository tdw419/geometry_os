; DESCRIPTION: Composite: Creates a red circular shape at (376, 90) with radius 39 then Draws a orange line from (406, 138) to (288, 229) then Places a red dot at position (105, 219).
; PLAN: r0=376(x), r1=90(y), r2=39(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=406(x1), r6=138(y1), r7=288(x2), r8=229(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=105(x), r11=219(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 376
LDI r1, 90
LDI r2, 39
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 406
LDI r6, 138
LDI r7, 288
LDI r8, 229
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 105
LDI r11, 219
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
