; DESCRIPTION: Composite: Draws a white rectangle at (172, 121) with width 35 and height 14 then Renders a black line between points (121, 77) and (445, 56).
; PLAN: r0=172(x), r1=121(y), r2=35(width), r3=14(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=121(x1), r6=77(y1), r7=445(x2), r8=56(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 172
LDI r1, 121
LDI r2, 35
LDI r3, 14
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 121
LDI r6, 77
LDI r7, 445
LDI r8, 56
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
