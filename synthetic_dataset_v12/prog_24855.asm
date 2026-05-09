; DESCRIPTION: Composite: Sets a single white pixel at (355, 110) then Draws a white line from (193, 224) to (55, 239) then Draws a cyan circle centered at (189, 187) with radius 49.
; PLAN: r0=355(x), r1=110(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=193(x1), r6=224(y1), r7=55(x2), r8=239(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=189(x), r11=187(y), r12=49(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 355
LDI r1, 110
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 193
LDI r6, 224
LDI r7, 55
LDI r8, 239
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 189
LDI r11, 187
LDI r12, 49
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
