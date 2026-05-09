; DESCRIPTION: Composite: Renders a cyan line between points (64, 5) and (95, 18) then Draws a black circle centered at (282, 118) with radius 68 then Places a green dot at position (476, 19).
; PLAN: r0=64(x1), r1=5(y1), r2=95(x2), r3=18(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=282(x), r6=118(y), r7=68(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=476(x), r11=19(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 64
LDI r1, 5
LDI r2, 95
LDI r3, 18
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 282
LDI r6, 118
LDI r7, 68
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 476
LDI r11, 19
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
