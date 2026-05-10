; DESCRIPTION: Composite: Renders a magenta disk with center (225, 155) and radius 60 then Renders a blue line between points (30, 114) and (502, 157).
; PLAN: r0=225(x), r1=155(y), r2=60(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=30(x1), r6=114(y1), r7=502(x2), r8=157(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 225
LDI r1, 155
LDI r2, 60
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 30
LDI r6, 114
LDI r7, 502
LDI r8, 157
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
