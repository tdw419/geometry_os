; DESCRIPTION: Composite: Draws a purple line from (376, 189) to (146, 218) then Draws a cyan rectangle at (453, 137) with width 12 and height 118.
; PLAN: r0=376(x1), r1=189(y1), r2=146(x2), r3=218(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=453(x), r6=137(y), r7=12(width), r8=118(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 376
LDI r1, 189
LDI r2, 146
LDI r3, 218
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 453
LDI r6, 137
LDI r7, 12
LDI r8, 118
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
