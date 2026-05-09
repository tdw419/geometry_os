; DESCRIPTION: Composite: Renders a black line between points (229, 20) and (345, 2) then Places a black circle of radius 34 at center (210, 188) then Places a black dot at position (257, 88).
; PLAN: r0=229(x1), r1=20(y1), r2=345(x2), r3=2(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=210(x), r6=188(y), r7=34(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=257(x), r11=88(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 229
LDI r1, 20
LDI r2, 345
LDI r3, 2
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 210
LDI r6, 188
LDI r7, 34
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 257
LDI r11, 88
LDI r12, 0x000000
PSET r10, r11, r12
HALT
