; DESCRIPTION: Composite: Places a cyan line segment connecting (306, 53) to (473, 189) then Creates a black rectangular region at (420, 123) spanning 39 by 87 pixels then Sets a single red pixel at (475, 36).
; PLAN: r0=306(x1), r1=53(y1), r2=473(x2), r3=189(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=420(x), r6=123(y), r7=39(width), r8=87(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=475(x), r11=36(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 306
LDI r1, 53
LDI r2, 473
LDI r3, 189
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 420
LDI r6, 123
LDI r7, 39
LDI r8, 87
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 475
LDI r11, 36
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
