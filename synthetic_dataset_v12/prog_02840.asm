; DESCRIPTION: Composite: Renders a black line between points (357, 60) and (239, 206) then Sets a single cyan pixel at (35, 249) then Places a yellow circle of radius 32 at center (477, 53).
; PLAN: r0=357(x1), r1=60(y1), r2=239(x2), r3=206(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=35(x), r6=249(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=477(x), r11=53(y), r12=32(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 357
LDI r1, 60
LDI r2, 239
LDI r3, 206
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 35
LDI r6, 249
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 477
LDI r11, 53
LDI r12, 32
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
