; DESCRIPTION: Composite: Renders a purple line between points (356, 83) and (134, 175) then Renders a red disk with center (367, 202) and radius 18.
; PLAN: r0=356(x1), r1=83(y1), r2=134(x2), r3=175(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=367(x), r6=202(y), r7=18(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 356
LDI r1, 83
LDI r2, 134
LDI r3, 175
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 367
LDI r6, 202
LDI r7, 18
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
