; DESCRIPTION: Composite: Draws a yellow line from (60, 64) to (250, 206) then Places a yellow circle of radius 71 at center (317, 134) then Places a green dot at position (396, 35).
; PLAN: r0=60(x1), r1=64(y1), r2=250(x2), r3=206(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=317(x), r6=134(y), r7=71(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=396(x), r11=35(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 60
LDI r1, 64
LDI r2, 250
LDI r3, 206
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 317
LDI r6, 134
LDI r7, 71
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 396
LDI r11, 35
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
