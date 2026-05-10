; DESCRIPTION: Composite: Draws a cyan line from (167, 151) to (57, 191) then Renders a white box of size 75x97 starting at (82, 11) then Draws a white circle centered at (378, 85) with radius 50.
; PLAN: r0=167(x1), r1=151(y1), r2=57(x2), r3=191(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=82(x), r6=11(y), r7=75(width), r8=97(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=378(x), r11=85(y), r12=50(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 167
LDI r1, 151
LDI r2, 57
LDI r3, 191
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 82
LDI r6, 11
LDI r7, 75
LDI r8, 97
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 378
LDI r11, 85
LDI r12, 50
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
