; DESCRIPTION: Composite: Places a white dot at position (492, 30) then Renders a yellow line between points (149, 64) and (324, 103) then Draws a red circle centered at (171, 175) with radius 52.
; PLAN: r0=492(x), r1=30(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=149(x1), r6=64(y1), r7=324(x2), r8=103(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=171(x), r11=175(y), r12=52(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 492
LDI r1, 30
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 149
LDI r6, 64
LDI r7, 324
LDI r8, 103
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 171
LDI r11, 175
LDI r12, 52
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
