; DESCRIPTION: Composite: Renders a yellow line between points (57, 197) and (125, 239) then Places a cyan dot at position (468, 81) then Renders a black disk with center (215, 69) and radius 46.
; PLAN: r0=57(x1), r1=197(y1), r2=125(x2), r3=239(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=468(x), r6=81(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=215(x), r11=69(y), r12=46(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 57
LDI r1, 197
LDI r2, 125
LDI r3, 239
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 468
LDI r6, 81
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 215
LDI r11, 69
LDI r12, 46
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
