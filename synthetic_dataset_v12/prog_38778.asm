; DESCRIPTION: Composite: Renders a magenta disk with center (235, 116) and radius 43 then Renders a yellow line between points (249, 61) and (196, 230).
; PLAN: r0=235(x), r1=116(y), r2=43(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=249(x1), r6=61(y1), r7=196(x2), r8=230(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 235
LDI r1, 116
LDI r2, 43
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 249
LDI r6, 61
LDI r7, 196
LDI r8, 230
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
