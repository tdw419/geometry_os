; DESCRIPTION: Composite: Draws a black circle centered at (90, 57) with radius 54 then Renders a white line between points (184, 197) and (242, 71) then Sets a single red pixel at (456, 88).
; PLAN: r0=90(x), r1=57(y), r2=54(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=184(x1), r6=197(y1), r7=242(x2), r8=71(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=456(x), r11=88(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 90
LDI r1, 57
LDI r2, 54
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 184
LDI r6, 197
LDI r7, 242
LDI r8, 71
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 456
LDI r11, 88
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
