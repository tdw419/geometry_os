; DESCRIPTION: Composite: Sets a single cyan pixel at (410, 68) then Renders a black box of size 85x29 starting at (222, 76) then Renders a red line between points (161, 74) and (0, 123).
; PLAN: r0=410(x), r1=68(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=222(x), r6=76(y), r7=85(width), r8=29(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=161(x1), r11=74(y1), r12=0(x2), r13=123(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 410
LDI r1, 68
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 222
LDI r6, 76
LDI r7, 85
LDI r8, 29
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 161
LDI r11, 74
LDI r12, 0
LDI r13, 123
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
