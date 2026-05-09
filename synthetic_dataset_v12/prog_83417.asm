; DESCRIPTION: Composite: Renders a blue box of size 34x12 starting at (430, 141) then Draws a blue line from (309, 147) to (295, 115).
; PLAN: r0=430(x), r1=141(y), r2=34(width), r3=12(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=309(x1), r6=147(y1), r7=295(x2), r8=115(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 430
LDI r1, 141
LDI r2, 34
LDI r3, 12
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 309
LDI r6, 147
LDI r7, 295
LDI r8, 115
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
