; DESCRIPTION: Composite: Draws a purple rectangle at (85, 4) with width 55 and height 22 then Draws a cyan line from (163, 195) to (10, 62).
; PLAN: r0=85(x), r1=4(y), r2=55(width), r3=22(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=163(x1), r6=195(y1), r7=10(x2), r8=62(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 85
LDI r1, 4
LDI r2, 55
LDI r3, 22
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 163
LDI r6, 195
LDI r7, 10
LDI r8, 62
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
