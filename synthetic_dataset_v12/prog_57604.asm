; DESCRIPTION: Composite: Draws a red rectangle at (26, 87) with width 93 and height 28 then Renders a blue line between points (398, 206) and (432, 49).
; PLAN: r0=26(x), r1=87(y), r2=93(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=398(x1), r6=206(y1), r7=432(x2), r8=49(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 26
LDI r1, 87
LDI r2, 93
LDI r3, 28
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 398
LDI r6, 206
LDI r7, 432
LDI r8, 49
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
