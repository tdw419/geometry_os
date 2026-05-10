; DESCRIPTION: Composite: Draws a black circle centered at (181, 189) with radius 60 then Draws a cyan line from (235, 152) to (435, 52).
; PLAN: r0=181(x), r1=189(y), r2=60(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=235(x1), r6=152(y1), r7=435(x2), r8=52(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 181
LDI r1, 189
LDI r2, 60
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 235
LDI r6, 152
LDI r7, 435
LDI r8, 52
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
