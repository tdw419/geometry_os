; DESCRIPTION: Composite: Draws a magenta rectangle at (124, 35) with width 80 and height 21 then Renders a cyan line between points (205, 121) and (287, 118).
; PLAN: r0=124(x), r1=35(y), r2=80(width), r3=21(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=205(x1), r6=121(y1), r7=287(x2), r8=118(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 124
LDI r1, 35
LDI r2, 80
LDI r3, 21
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 205
LDI r6, 121
LDI r7, 287
LDI r8, 118
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
