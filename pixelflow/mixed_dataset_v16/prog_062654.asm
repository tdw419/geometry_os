; DESCRIPTION: Composite: Renders a black line between points (256, 145) and (21, 19) then Places a green dot at position (19, 103) then Renders a magenta disk with center (297, 184) and radius 38.
; PLAN: r0=256(x1), r1=145(y1), r2=21(x2), r3=19(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=19(x), r6=103(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=297(x), r11=184(y), r12=38(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 256
LDI r1, 145
LDI r2, 21
LDI r3, 19
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 19
LDI r6, 103
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 297
LDI r11, 184
LDI r12, 38
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
