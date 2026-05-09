; DESCRIPTION: Composite: Draws a purple line from (291, 11) to (481, 66) then Renders a black box of size 37x107 starting at (329, 38) then Sets a single black pixel at (276, 149).
; PLAN: r0=291(x1), r1=11(y1), r2=481(x2), r3=66(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=329(x), r6=38(y), r7=37(width), r8=107(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=276(x), r11=149(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 291
LDI r1, 11
LDI r2, 481
LDI r3, 66
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 329
LDI r6, 38
LDI r7, 37
LDI r8, 107
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 276
LDI r11, 149
LDI r12, 0x000000
PSET r10, r11, r12
HALT
