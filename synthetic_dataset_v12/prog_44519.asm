; DESCRIPTION: Composite: Renders a yellow line between points (21, 238) and (261, 202) then Draws a orange circle centered at (386, 137) with radius 50.
; PLAN: r0=21(x1), r1=238(y1), r2=261(x2), r3=202(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=386(x), r6=137(y), r7=50(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 21
LDI r1, 238
LDI r2, 261
LDI r3, 202
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 386
LDI r6, 137
LDI r7, 50
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
