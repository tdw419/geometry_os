; DESCRIPTION: Composite: Renders a cyan line between points (260, 17) and (107, 197) then Renders a purple disk with center (282, 68) and radius 37.
; PLAN: r0=260(x1), r1=17(y1), r2=107(x2), r3=197(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=282(x), r6=68(y), r7=37(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 260
LDI r1, 17
LDI r2, 107
LDI r3, 197
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 282
LDI r6, 68
LDI r7, 37
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
