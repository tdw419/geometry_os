; DESCRIPTION: Composite: Renders a black box of size 29x22 starting at (352, 10) then Renders a magenta line between points (4, 247) and (47, 9) then Sets a single black pixel at (290, 162).
; PLAN: r0=352(x), r1=10(y), r2=29(width), r3=22(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=4(x1), r6=247(y1), r7=47(x2), r8=9(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=290(x), r11=162(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 352
LDI r1, 10
LDI r2, 29
LDI r3, 22
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 4
LDI r6, 247
LDI r7, 47
LDI r8, 9
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 290
LDI r11, 162
LDI r12, 0x000000
PSET r10, r11, r12
HALT
