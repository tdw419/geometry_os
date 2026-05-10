; DESCRIPTION: Composite: Renders a blue line between points (250, 58) and (96, 171) then Places a blue circle of radius 29 at center (264, 168).
; PLAN: r0=250(x1), r1=58(y1), r2=96(x2), r3=171(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=264(x), r6=168(y), r7=29(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 250
LDI r1, 58
LDI r2, 96
LDI r3, 171
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 264
LDI r6, 168
LDI r7, 29
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
