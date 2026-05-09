; DESCRIPTION: Composite: Draws a black rectangle at (268, 144) with width 94 and height 49 then Draws a red line from (450, 53) to (360, 157).
; PLAN: r0=268(x), r1=144(y), r2=94(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=450(x1), r6=53(y1), r7=360(x2), r8=157(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 268
LDI r1, 144
LDI r2, 94
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 450
LDI r6, 53
LDI r7, 360
LDI r8, 157
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
