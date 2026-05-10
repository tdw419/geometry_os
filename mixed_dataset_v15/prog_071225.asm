; DESCRIPTION: Composite: Places a green circle of radius 28 at center (434, 115) then Renders a blue line between points (506, 165) and (48, 97).
; PLAN: r0=434(x), r1=115(y), r2=28(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=506(x1), r6=165(y1), r7=48(x2), r8=97(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 434
LDI r1, 115
LDI r2, 28
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 506
LDI r6, 165
LDI r7, 48
LDI r8, 97
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
