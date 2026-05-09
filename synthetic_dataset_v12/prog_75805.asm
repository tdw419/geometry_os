; DESCRIPTION: Composite: Creates a orange rectangular region at (298, 140) spanning 60 by 43 pixels then Places a black line segment connecting (124, 64) to (59, 150) then Sets a single black pixel at (248, 176).
; PLAN: r0=298(x), r1=140(y), r2=60(width), r3=43(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=124(x1), r6=64(y1), r7=59(x2), r8=150(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=248(x), r11=176(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 298
LDI r1, 140
LDI r2, 60
LDI r3, 43
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 124
LDI r6, 64
LDI r7, 59
LDI r8, 150
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 248
LDI r11, 176
LDI r12, 0x000000
PSET r10, r11, r12
HALT
