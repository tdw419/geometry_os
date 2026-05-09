; DESCRIPTION: Composite: Sets a single orange pixel at (93, 117) then Places a black 22x100 rectangle at position (472, 8) then Renders a orange line between points (161, 81) and (79, 218).
; PLAN: r0=93(x), r1=117(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=472(x), r6=8(y), r7=22(width), r8=100(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=161(x1), r11=81(y1), r12=79(x2), r13=218(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 93
LDI r1, 117
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 472
LDI r6, 8
LDI r7, 22
LDI r8, 100
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 161
LDI r11, 81
LDI r12, 79
LDI r13, 218
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
