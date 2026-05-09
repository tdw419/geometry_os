; DESCRIPTION: Composite: Creates a orange rectangular region at (80, 112) spanning 17 by 80 pixels then Draws a black line from (52, 227) to (349, 139) then Places a red dot at position (310, 159).
; PLAN: r0=80(x), r1=112(y), r2=17(width), r3=80(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=52(x1), r6=227(y1), r7=349(x2), r8=139(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=310(x), r11=159(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 80
LDI r1, 112
LDI r2, 17
LDI r3, 80
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 52
LDI r6, 227
LDI r7, 349
LDI r8, 139
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 310
LDI r11, 159
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
