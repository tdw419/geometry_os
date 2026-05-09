; DESCRIPTION: Composite: Renders a blue line between points (384, 97) and (105, 29) then Places a blue dot at position (253, 51) then Renders a white disk with center (416, 113) and radius 40.
; PLAN: r0=384(x1), r1=97(y1), r2=105(x2), r3=29(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=253(x), r6=51(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=416(x), r11=113(y), r12=40(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 384
LDI r1, 97
LDI r2, 105
LDI r3, 29
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 253
LDI r6, 51
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 416
LDI r11, 113
LDI r12, 40
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
