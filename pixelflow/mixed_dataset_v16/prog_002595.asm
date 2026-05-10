; DESCRIPTION: Composite: Draws a red circle centered at (44, 107) with radius 37 then Sets a single green pixel at (108, 13) then Draws a orange line from (252, 138) to (249, 255).
; PLAN: r0=44(x), r1=107(y), r2=37(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=108(x), r6=13(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=252(x1), r11=138(y1), r12=249(x2), r13=255(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 44
LDI r1, 107
LDI r2, 37
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 108
LDI r6, 13
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 252
LDI r11, 138
LDI r12, 249
LDI r13, 255
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
