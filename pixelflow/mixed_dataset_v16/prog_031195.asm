; DESCRIPTION: Composite: Renders a black line between points (208, 82) and (42, 28) then Creates a yellow circular shape at (272, 151) with radius 36 then Sets a single cyan pixel at (456, 127).
; PLAN: r0=208(x1), r1=82(y1), r2=42(x2), r3=28(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=272(x), r6=151(y), r7=36(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=456(x), r11=127(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 208
LDI r1, 82
LDI r2, 42
LDI r3, 28
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 272
LDI r6, 151
LDI r7, 36
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 456
LDI r11, 127
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
