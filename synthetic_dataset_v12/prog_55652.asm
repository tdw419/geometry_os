; DESCRIPTION: Composite: Draws a black line from (214, 96) to (314, 21) then Draws a black circle centered at (271, 155) with radius 78.
; PLAN: r0=214(x1), r1=96(y1), r2=314(x2), r3=21(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=271(x), r6=155(y), r7=78(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 214
LDI r1, 96
LDI r2, 314
LDI r3, 21
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 271
LDI r6, 155
LDI r7, 78
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
