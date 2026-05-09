; DESCRIPTION: Composite: Draws a red rectangle at (455, 77) with width 14 and height 27 then Draws a orange line from (157, 119) to (305, 153).
; PLAN: r0=455(x), r1=77(y), r2=14(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=157(x1), r6=119(y1), r7=305(x2), r8=153(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 455
LDI r1, 77
LDI r2, 14
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 157
LDI r6, 119
LDI r7, 305
LDI r8, 153
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
