; DESCRIPTION: Composite: Places a black dot at position (162, 1) then Renders a red line between points (99, 5) and (95, 223) then Places a magenta 90x78 rectangle at position (27, 72).
; PLAN: r0=162(x), r1=1(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=99(x1), r6=5(y1), r7=95(x2), r8=223(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=27(x), r11=72(y), r12=90(width), r13=78(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 162
LDI r1, 1
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 99
LDI r6, 5
LDI r7, 95
LDI r8, 223
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 27
LDI r11, 72
LDI r12, 90
LDI r13, 78
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
