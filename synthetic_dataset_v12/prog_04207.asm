; DESCRIPTION: Composite: Renders a black line between points (462, 20) and (205, 170) then Draws a red rectangle at (249, 92) with width 83 and height 54.
; PLAN: r0=462(x1), r1=20(y1), r2=205(x2), r3=170(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=249(x), r6=92(y), r7=83(width), r8=54(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 462
LDI r1, 20
LDI r2, 205
LDI r3, 170
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 249
LDI r6, 92
LDI r7, 83
LDI r8, 54
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
