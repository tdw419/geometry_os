; DESCRIPTION: Composite: Places a yellow circle of radius 35 at center (147, 197) then Renders a red line between points (503, 163) and (176, 47).
; PLAN: r0=147(x), r1=197(y), r2=35(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=503(x1), r6=163(y1), r7=176(x2), r8=47(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 147
LDI r1, 197
LDI r2, 35
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 503
LDI r6, 163
LDI r7, 176
LDI r8, 47
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
