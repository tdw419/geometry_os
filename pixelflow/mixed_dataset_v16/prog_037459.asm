; DESCRIPTION: Composite: Draws a white circle centered at (298, 93) with radius 73 then Places a magenta line segment connecting (421, 164) to (382, 142) then Sets a single black pixel at (443, 91).
; PLAN: r0=298(x), r1=93(y), r2=73(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=421(x1), r6=164(y1), r7=382(x2), r8=142(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=443(x), r11=91(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 298
LDI r1, 93
LDI r2, 73
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 421
LDI r6, 164
LDI r7, 382
LDI r8, 142
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 443
LDI r11, 91
LDI r12, 0x000000
PSET r10, r11, r12
HALT
