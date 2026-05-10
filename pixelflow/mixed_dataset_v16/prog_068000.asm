; DESCRIPTION: Composite: Renders a green line between points (208, 34) and (71, 230) then Renders a magenta disk with center (430, 137) and radius 16.
; PLAN: r0=208(x1), r1=34(y1), r2=71(x2), r3=230(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=430(x), r6=137(y), r7=16(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 208
LDI r1, 34
LDI r2, 71
LDI r3, 230
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 430
LDI r6, 137
LDI r7, 16
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
