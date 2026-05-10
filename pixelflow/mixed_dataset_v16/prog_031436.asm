; DESCRIPTION: Composite: Places a black line segment connecting (212, 61) to (123, 227) then Renders a red disk with center (236, 160) and radius 77.
; PLAN: r0=212(x1), r1=61(y1), r2=123(x2), r3=227(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=236(x), r6=160(y), r7=77(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 212
LDI r1, 61
LDI r2, 123
LDI r3, 227
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 236
LDI r6, 160
LDI r7, 77
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
