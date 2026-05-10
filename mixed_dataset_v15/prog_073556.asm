; DESCRIPTION: Composite: Draws a red line from (78, 16) to (93, 181) then Draws a cyan rectangle at (197, 131) with width 110 and height 71.
; PLAN: r0=78(x1), r1=16(y1), r2=93(x2), r3=181(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=197(x), r6=131(y), r7=110(width), r8=71(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 78
LDI r1, 16
LDI r2, 93
LDI r3, 181
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 197
LDI r6, 131
LDI r7, 110
LDI r8, 71
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
