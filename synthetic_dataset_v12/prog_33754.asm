; DESCRIPTION: Composite: Draws a orange line from (320, 118) to (291, 21) then Creates a red circular shape at (261, 93) with radius 43.
; PLAN: r0=320(x1), r1=118(y1), r2=291(x2), r3=21(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=261(x), r6=93(y), r7=43(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 320
LDI r1, 118
LDI r2, 291
LDI r3, 21
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 261
LDI r6, 93
LDI r7, 43
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
