; DESCRIPTION: Composite: Renders a yellow line between points (404, 61) and (100, 13) then Places a white circle of radius 66 at center (322, 74) then Places a red dot at position (349, 225).
; PLAN: r0=404(x1), r1=61(y1), r2=100(x2), r3=13(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=322(x), r6=74(y), r7=66(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=349(x), r11=225(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 404
LDI r1, 61
LDI r2, 100
LDI r3, 13
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 322
LDI r6, 74
LDI r7, 66
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 349
LDI r11, 225
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
