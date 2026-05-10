; DESCRIPTION: Composite: Renders a cyan line between points (55, 101) and (342, 171) then Renders a white disk with center (474, 105) and radius 38.
; PLAN: r0=55(x1), r1=101(y1), r2=342(x2), r3=171(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=474(x), r6=105(y), r7=38(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 55
LDI r1, 101
LDI r2, 342
LDI r3, 171
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 474
LDI r6, 105
LDI r7, 38
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
