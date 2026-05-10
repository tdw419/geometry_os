; DESCRIPTION: Composite: Renders a white line between points (114, 66) and (188, 8) then Renders a orange box of size 22x96 starting at (473, 57) then Sets a single yellow pixel at (497, 218).
; PLAN: r0=114(x1), r1=66(y1), r2=188(x2), r3=8(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=473(x), r6=57(y), r7=22(width), r8=96(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=497(x), r11=218(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 114
LDI r1, 66
LDI r2, 188
LDI r3, 8
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 473
LDI r6, 57
LDI r7, 22
LDI r8, 96
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 497
LDI r11, 218
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
