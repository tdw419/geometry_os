; DESCRIPTION: Composite: Draws a white circle centered at (149, 86) with radius 54 then Draws a yellow line from (215, 173) to (250, 112).
; PLAN: r0=149(x), r1=86(y), r2=54(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=215(x1), r6=173(y1), r7=250(x2), r8=112(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 149
LDI r1, 86
LDI r2, 54
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 215
LDI r6, 173
LDI r7, 250
LDI r8, 112
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
