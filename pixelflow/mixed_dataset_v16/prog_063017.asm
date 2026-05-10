; DESCRIPTION: Composite: Renders a purple line between points (102, 66) and (34, 0) then Draws a green rectangle at (234, 83) with width 92 and height 72 then Places a red dot at position (96, 139).
; PLAN: r0=102(x1), r1=66(y1), r2=34(x2), r3=0(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=234(x), r6=83(y), r7=92(width), r8=72(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=96(x), r11=139(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 102
LDI r1, 66
LDI r2, 34
LDI r3, 0
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 234
LDI r6, 83
LDI r7, 92
LDI r8, 72
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 96
LDI r11, 139
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
