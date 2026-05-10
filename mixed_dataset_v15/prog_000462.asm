; DESCRIPTION: Composite: Places a orange line segment connecting (468, 83) to (324, 10) then Renders a yellow box of size 29x103 starting at (74, 5) then Places a black dot at position (413, 68).
; PLAN: r0=468(x1), r1=83(y1), r2=324(x2), r3=10(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=74(x), r6=5(y), r7=29(width), r8=103(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=413(x), r11=68(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 468
LDI r1, 83
LDI r2, 324
LDI r3, 10
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 74
LDI r6, 5
LDI r7, 29
LDI r8, 103
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 413
LDI r11, 68
LDI r12, 0x000000
PSET r10, r11, r12
HALT
