; DESCRIPTION: Composite: Renders a magenta line between points (67, 255) and (314, 221) then Renders a black disk with center (469, 122) and radius 41 then Sets a single cyan pixel at (230, 157).
; PLAN: r0=67(x1), r1=255(y1), r2=314(x2), r3=221(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=469(x), r6=122(y), r7=41(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=230(x), r11=157(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 67
LDI r1, 255
LDI r2, 314
LDI r3, 221
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 469
LDI r6, 122
LDI r7, 41
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 230
LDI r11, 157
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
