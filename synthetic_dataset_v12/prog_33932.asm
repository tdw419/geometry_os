; DESCRIPTION: Composite: Renders a black line between points (76, 17) and (224, 125) then Renders a orange disk with center (345, 127) and radius 54 then Places a orange dot at position (98, 82).
; PLAN: r0=76(x1), r1=17(y1), r2=224(x2), r3=125(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=345(x), r6=127(y), r7=54(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=98(x), r11=82(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 76
LDI r1, 17
LDI r2, 224
LDI r3, 125
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 345
LDI r6, 127
LDI r7, 54
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 98
LDI r11, 82
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
