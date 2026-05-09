; DESCRIPTION: Composite: Draws a purple rectangle at (77, 46) with width 63 and height 39 then Draws a orange line from (179, 142) to (337, 83).
; PLAN: r0=77(x), r1=46(y), r2=63(width), r3=39(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=179(x1), r6=142(y1), r7=337(x2), r8=83(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 77
LDI r1, 46
LDI r2, 63
LDI r3, 39
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 179
LDI r6, 142
LDI r7, 337
LDI r8, 83
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
