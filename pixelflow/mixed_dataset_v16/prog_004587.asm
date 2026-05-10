; DESCRIPTION: Composite: Draws a blue rectangle at (93, 118) with width 33 and height 24 then Draws a red line from (436, 209) to (77, 94).
; PLAN: r0=93(x), r1=118(y), r2=33(width), r3=24(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=436(x1), r6=209(y1), r7=77(x2), r8=94(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 93
LDI r1, 118
LDI r2, 33
LDI r3, 24
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 436
LDI r6, 209
LDI r7, 77
LDI r8, 94
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
