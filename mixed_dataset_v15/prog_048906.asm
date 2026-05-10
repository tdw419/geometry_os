; DESCRIPTION: Composite: Places a red 13x89 rectangle at position (410, 91) then Places a black dot at position (337, 162) then Draws a black circle centered at (335, 227) with radius 15.
; PLAN: r0=410(x), r1=91(y), r2=13(width), r3=89(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=337(x), r6=162(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=335(x), r11=227(y), r12=15(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 410
LDI r1, 91
LDI r2, 13
LDI r3, 89
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 337
LDI r6, 162
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 335
LDI r11, 227
LDI r12, 15
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
