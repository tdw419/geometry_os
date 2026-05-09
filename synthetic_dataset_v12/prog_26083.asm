; DESCRIPTION: Composite: Draws a red rectangle at (86, 12) with width 26 and height 17 then Draws a black line from (410, 90) to (327, 211).
; PLAN: r0=86(x), r1=12(y), r2=26(width), r3=17(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=410(x1), r6=90(y1), r7=327(x2), r8=211(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 86
LDI r1, 12
LDI r2, 26
LDI r3, 17
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 410
LDI r6, 90
LDI r7, 327
LDI r8, 211
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
