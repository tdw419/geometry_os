; DESCRIPTION: Composite: Places a green 12x31 rectangle at position (322, 17) then Renders a black line between points (478, 146) and (300, 237).
; PLAN: r0=322(x), r1=17(y), r2=12(width), r3=31(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=478(x1), r6=146(y1), r7=300(x2), r8=237(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 322
LDI r1, 17
LDI r2, 12
LDI r3, 31
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 478
LDI r6, 146
LDI r7, 300
LDI r8, 237
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
