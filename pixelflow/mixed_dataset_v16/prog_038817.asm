; DESCRIPTION: Composite: Draws a yellow line from (262, 15) to (322, 30) then Places a purple circle of radius 41 at center (298, 128) then Sets a single white pixel at (273, 96).
; PLAN: r0=262(x1), r1=15(y1), r2=322(x2), r3=30(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=298(x), r6=128(y), r7=41(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=273(x), r11=96(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 262
LDI r1, 15
LDI r2, 322
LDI r3, 30
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 298
LDI r6, 128
LDI r7, 41
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 273
LDI r11, 96
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
