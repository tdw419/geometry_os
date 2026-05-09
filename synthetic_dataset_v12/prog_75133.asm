; DESCRIPTION: Composite: Places a yellow dot at position (313, 39) then Renders a black box of size 18x73 starting at (334, 110) then Renders a red line between points (463, 164) and (392, 97).
; PLAN: r0=313(x), r1=39(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=334(x), r6=110(y), r7=18(width), r8=73(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=463(x1), r11=164(y1), r12=392(x2), r13=97(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 313
LDI r1, 39
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 334
LDI r6, 110
LDI r7, 18
LDI r8, 73
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 463
LDI r11, 164
LDI r12, 392
LDI r13, 97
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
