; DESCRIPTION: Composite: Draws a black rectangle at (495, 186) with width 14 and height 61 then Draws a black line from (45, 95) to (367, 192).
; PLAN: r0=495(x), r1=186(y), r2=14(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=45(x1), r6=95(y1), r7=367(x2), r8=192(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 495
LDI r1, 186
LDI r2, 14
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 45
LDI r6, 95
LDI r7, 367
LDI r8, 192
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
