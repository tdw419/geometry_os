; DESCRIPTION: Composite: Creates a white circular shape at (239, 119) with radius 64 then Renders a black line between points (442, 85) and (77, 164) then Places a white dot at position (226, 11).
; PLAN: r0=239(x), r1=119(y), r2=64(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=442(x1), r6=85(y1), r7=77(x2), r8=164(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=226(x), r11=11(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 239
LDI r1, 119
LDI r2, 64
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 442
LDI r6, 85
LDI r7, 77
LDI r8, 164
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 226
LDI r11, 11
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
