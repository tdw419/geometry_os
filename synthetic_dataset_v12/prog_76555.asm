; DESCRIPTION: Composite: Draws a purple rectangle at (380, 202) with width 14 and height 17 then Renders a cyan line between points (282, 113) and (223, 78).
; PLAN: r0=380(x), r1=202(y), r2=14(width), r3=17(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=282(x1), r6=113(y1), r7=223(x2), r8=78(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 380
LDI r1, 202
LDI r2, 14
LDI r3, 17
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 282
LDI r6, 113
LDI r7, 223
LDI r8, 78
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
