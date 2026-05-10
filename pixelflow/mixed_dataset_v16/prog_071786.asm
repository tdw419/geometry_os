; DESCRIPTION: Composite: Draws a black circle centered at (154, 143) with radius 52 then Renders a black line between points (470, 134) and (296, 164).
; PLAN: r0=154(x), r1=143(y), r2=52(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=470(x1), r6=134(y1), r7=296(x2), r8=164(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 154
LDI r1, 143
LDI r2, 52
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 470
LDI r6, 134
LDI r7, 296
LDI r8, 164
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
