; DESCRIPTION: Composite: Renders a red disk with center (234, 171) and radius 43 then Renders a white line between points (181, 203) and (247, 230).
; PLAN: r0=234(x), r1=171(y), r2=43(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=181(x1), r6=203(y1), r7=247(x2), r8=230(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 234
LDI r1, 171
LDI r2, 43
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 181
LDI r6, 203
LDI r7, 247
LDI r8, 230
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
