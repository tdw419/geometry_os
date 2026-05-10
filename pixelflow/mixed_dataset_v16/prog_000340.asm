; DESCRIPTION: Composite: Places a orange line segment connecting (193, 182) to (178, 79) then Renders a orange box of size 106x80 starting at (285, 131) then Places a black dot at position (504, 235).
; PLAN: r0=193(x1), r1=182(y1), r2=178(x2), r3=79(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=285(x), r6=131(y), r7=106(width), r8=80(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=504(x), r11=235(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 193
LDI r1, 182
LDI r2, 178
LDI r3, 79
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 285
LDI r6, 131
LDI r7, 106
LDI r8, 80
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 504
LDI r11, 235
LDI r12, 0x000000
PSET r10, r11, r12
HALT
