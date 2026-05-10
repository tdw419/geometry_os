; DESCRIPTION: Composite: Draws a black line from (507, 25) to (420, 131) then Creates a purple rectangular region at (10, 47) spanning 118 by 99 pixels then Places a magenta dot at position (225, 31).
; PLAN: r0=507(x1), r1=25(y1), r2=420(x2), r3=131(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=10(x), r6=47(y), r7=118(width), r8=99(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=225(x), r11=31(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 507
LDI r1, 25
LDI r2, 420
LDI r3, 131
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 10
LDI r6, 47
LDI r7, 118
LDI r8, 99
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 225
LDI r11, 31
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
