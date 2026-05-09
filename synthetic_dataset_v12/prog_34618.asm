; DESCRIPTION: Composite: Draws a cyan circle centered at (375, 125) with radius 46 then Renders a cyan line between points (288, 178) and (158, 246).
; PLAN: r0=375(x), r1=125(y), r2=46(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=288(x1), r6=178(y1), r7=158(x2), r8=246(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 375
LDI r1, 125
LDI r2, 46
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 288
LDI r6, 178
LDI r7, 158
LDI r8, 246
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
