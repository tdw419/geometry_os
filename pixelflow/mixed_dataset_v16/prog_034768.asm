; DESCRIPTION: Composite: Sets a single yellow pixel at (158, 223) then Draws a green rectangle at (271, 86) with width 101 and height 81 then Draws a cyan line from (250, 128) to (378, 142).
; PLAN: r0=158(x), r1=223(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=271(x), r6=86(y), r7=101(width), r8=81(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=250(x1), r11=128(y1), r12=378(x2), r13=142(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 158
LDI r1, 223
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 271
LDI r6, 86
LDI r7, 101
LDI r8, 81
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 250
LDI r11, 128
LDI r12, 378
LDI r13, 142
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
