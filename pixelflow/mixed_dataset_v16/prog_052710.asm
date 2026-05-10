; DESCRIPTION: Composite: Renders a orange line between points (253, 244) and (370, 35) then Renders a green disk with center (34, 184) and radius 33.
; PLAN: r0=253(x1), r1=244(y1), r2=370(x2), r3=35(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=34(x), r6=184(y), r7=33(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 253
LDI r1, 244
LDI r2, 370
LDI r3, 35
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 34
LDI r6, 184
LDI r7, 33
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
