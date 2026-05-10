; DESCRIPTION: Composite: Draws a purple line from (339, 142) to (364, 230) then Renders a orange box of size 95x107 starting at (317, 81).
; PLAN: r0=339(x1), r1=142(y1), r2=364(x2), r3=230(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=317(x), r6=81(y), r7=95(width), r8=107(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 339
LDI r1, 142
LDI r2, 364
LDI r3, 230
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 317
LDI r6, 81
LDI r7, 95
LDI r8, 107
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
