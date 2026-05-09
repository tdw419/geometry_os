; DESCRIPTION: Composite: Draws a red line from (346, 12) to (163, 72) then Draws a orange circle centered at (278, 165) with radius 80.
; PLAN: r0=346(x1), r1=12(y1), r2=163(x2), r3=72(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=278(x), r6=165(y), r7=80(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 346
LDI r1, 12
LDI r2, 163
LDI r3, 72
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 278
LDI r6, 165
LDI r7, 80
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
