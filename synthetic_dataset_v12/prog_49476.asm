; DESCRIPTION: Composite: Renders a orange line between points (328, 34) and (236, 99) then Renders a white disk with center (332, 87) and radius 48.
; PLAN: r0=328(x1), r1=34(y1), r2=236(x2), r3=99(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=332(x), r6=87(y), r7=48(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 328
LDI r1, 34
LDI r2, 236
LDI r3, 99
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 332
LDI r6, 87
LDI r7, 48
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
