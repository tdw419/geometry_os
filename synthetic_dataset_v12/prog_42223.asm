; DESCRIPTION: Composite: Renders a orange box of size 97x77 starting at (202, 149) then Draws a white line from (343, 5) to (4, 107) then Draws a green circle centered at (352, 139) with radius 77.
; PLAN: r0=202(x), r1=149(y), r2=97(width), r3=77(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=343(x1), r6=5(y1), r7=4(x2), r8=107(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=352(x), r11=139(y), r12=77(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 202
LDI r1, 149
LDI r2, 97
LDI r3, 77
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 343
LDI r6, 5
LDI r7, 4
LDI r8, 107
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 352
LDI r11, 139
LDI r12, 77
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
