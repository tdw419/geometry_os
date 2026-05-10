; DESCRIPTION: Composite: Renders a yellow line between points (509, 40) and (161, 115) then Places a blue circle of radius 21 at center (33, 204) then Places a white dot at position (6, 24).
; PLAN: r0=509(x1), r1=40(y1), r2=161(x2), r3=115(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=33(x), r6=204(y), r7=21(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=6(x), r11=24(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 509
LDI r1, 40
LDI r2, 161
LDI r3, 115
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 33
LDI r6, 204
LDI r7, 21
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 6
LDI r11, 24
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
