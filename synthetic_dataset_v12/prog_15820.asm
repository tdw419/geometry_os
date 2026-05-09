; DESCRIPTION: Composite: Draws a yellow rectangle at (14, 56) with width 97 and height 13 then Renders a red line between points (98, 83) and (342, 57).
; PLAN: r0=14(x), r1=56(y), r2=97(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=98(x1), r6=83(y1), r7=342(x2), r8=57(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 14
LDI r1, 56
LDI r2, 97
LDI r3, 13
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 98
LDI r6, 83
LDI r7, 342
LDI r8, 57
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
