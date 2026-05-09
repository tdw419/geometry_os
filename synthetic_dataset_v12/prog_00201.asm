; DESCRIPTION: Composite: Renders a orange line between points (399, 248) and (419, 186) then Places a orange 31x71 rectangle at position (193, 106) then Sets a single black pixel at (474, 178).
; PLAN: r0=399(x1), r1=248(y1), r2=419(x2), r3=186(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=193(x), r6=106(y), r7=31(width), r8=71(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=474(x), r11=178(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 399
LDI r1, 248
LDI r2, 419
LDI r3, 186
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 193
LDI r6, 106
LDI r7, 31
LDI r8, 71
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 474
LDI r11, 178
LDI r12, 0x000000
PSET r10, r11, r12
HALT
