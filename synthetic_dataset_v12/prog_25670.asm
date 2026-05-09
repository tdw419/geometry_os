; DESCRIPTION: Composite: Draws a red line from (248, 7) to (222, 161) then Creates a yellow circular shape at (320, 95) with radius 62.
; PLAN: r0=248(x1), r1=7(y1), r2=222(x2), r3=161(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=320(x), r6=95(y), r7=62(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 248
LDI r1, 7
LDI r2, 222
LDI r3, 161
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 320
LDI r6, 95
LDI r7, 62
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
