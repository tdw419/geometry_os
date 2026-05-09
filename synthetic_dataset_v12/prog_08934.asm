; DESCRIPTION: Composite: Draws a white circle centered at (287, 166) with radius 56 then Draws a red line from (320, 17) to (162, 193).
; PLAN: r0=287(x), r1=166(y), r2=56(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=320(x1), r6=17(y1), r7=162(x2), r8=193(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 287
LDI r1, 166
LDI r2, 56
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 320
LDI r6, 17
LDI r7, 162
LDI r8, 193
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
