; DESCRIPTION: Composite: Draws a purple circle centered at (304, 178) with radius 74 then Draws a orange line from (242, 1) to (35, 232).
; PLAN: r0=304(x), r1=178(y), r2=74(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=242(x1), r6=1(y1), r7=35(x2), r8=232(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 304
LDI r1, 178
LDI r2, 74
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 242
LDI r6, 1
LDI r7, 35
LDI r8, 232
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
