; DESCRIPTION: Composite: Places a purple dot at position (382, 136) then Renders a green line between points (272, 36) and (177, 196) then Places a red circle of radius 62 at center (328, 97).
; PLAN: r0=382(x), r1=136(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=272(x1), r6=36(y1), r7=177(x2), r8=196(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=328(x), r11=97(y), r12=62(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 382
LDI r1, 136
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 272
LDI r6, 36
LDI r7, 177
LDI r8, 196
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 328
LDI r11, 97
LDI r12, 62
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
