; DESCRIPTION: Composite: Draws a yellow line from (358, 102) to (406, 224) then Creates a orange circular shape at (477, 121) with radius 24.
; PLAN: r0=358(x1), r1=102(y1), r2=406(x2), r3=224(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=477(x), r6=121(y), r7=24(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 358
LDI r1, 102
LDI r2, 406
LDI r3, 224
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 477
LDI r6, 121
LDI r7, 24
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
