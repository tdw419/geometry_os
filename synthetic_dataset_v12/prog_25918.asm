; DESCRIPTION: Composite: Renders a black disk with center (336, 81) and radius 11 then Draws a white line from (204, 186) to (188, 136) then Places a blue dot at position (115, 139).
; PLAN: r0=336(x), r1=81(y), r2=11(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=204(x1), r6=186(y1), r7=188(x2), r8=136(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=115(x), r11=139(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 336
LDI r1, 81
LDI r2, 11
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 204
LDI r6, 186
LDI r7, 188
LDI r8, 136
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 115
LDI r11, 139
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
