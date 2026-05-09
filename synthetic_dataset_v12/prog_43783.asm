; DESCRIPTION: Composite: Draws a black circle centered at (102, 183) with radius 11 then Draws a black line from (365, 132) to (271, 148).
; PLAN: r0=102(x), r1=183(y), r2=11(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=365(x1), r6=132(y1), r7=271(x2), r8=148(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 102
LDI r1, 183
LDI r2, 11
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 365
LDI r6, 132
LDI r7, 271
LDI r8, 148
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
