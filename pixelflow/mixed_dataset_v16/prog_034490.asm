; DESCRIPTION: Composite: Renders a purple line between points (282, 179) and (286, 209) then Renders a cyan disk with center (299, 148) and radius 54.
; PLAN: r0=282(x1), r1=179(y1), r2=286(x2), r3=209(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=299(x), r6=148(y), r7=54(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 282
LDI r1, 179
LDI r2, 286
LDI r3, 209
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 299
LDI r6, 148
LDI r7, 54
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
