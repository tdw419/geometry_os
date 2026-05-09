; DESCRIPTION: Composite: Renders a red line between points (455, 193) and (251, 143) then Renders a green disk with center (29, 165) and radius 25.
; PLAN: r0=455(x1), r1=193(y1), r2=251(x2), r3=143(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=29(x), r6=165(y), r7=25(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 455
LDI r1, 193
LDI r2, 251
LDI r3, 143
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 29
LDI r6, 165
LDI r7, 25
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
