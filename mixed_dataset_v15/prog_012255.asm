; DESCRIPTION: Composite: Draws a green rectangle at (13, 93) with width 95 and height 109 then Draws a purple line from (13, 143) to (295, 249).
; PLAN: r0=13(x), r1=93(y), r2=95(width), r3=109(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=13(x1), r6=143(y1), r7=295(x2), r8=249(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 13
LDI r1, 93
LDI r2, 95
LDI r3, 109
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 13
LDI r6, 143
LDI r7, 295
LDI r8, 249
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
