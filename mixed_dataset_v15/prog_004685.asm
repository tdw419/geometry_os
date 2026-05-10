; DESCRIPTION: Composite: Draws a green rectangle at (282, 113) with width 41 and height 76 then Draws a white line from (129, 11) to (74, 49).
; PLAN: r0=282(x), r1=113(y), r2=41(width), r3=76(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=129(x1), r6=11(y1), r7=74(x2), r8=49(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 282
LDI r1, 113
LDI r2, 41
LDI r3, 76
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 129
LDI r6, 11
LDI r7, 74
LDI r8, 49
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
