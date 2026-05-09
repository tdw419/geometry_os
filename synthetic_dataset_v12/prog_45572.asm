; DESCRIPTION: Composite: Renders a yellow disk with center (157, 41) and radius 26 then Places a purple dot at position (86, 83) then Places a cyan line segment connecting (139, 216) to (255, 164).
; PLAN: r0=157(x), r1=41(y), r2=26(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=86(x), r6=83(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=139(x1), r11=216(y1), r12=255(x2), r13=164(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 157
LDI r1, 41
LDI r2, 26
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 86
LDI r6, 83
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 139
LDI r11, 216
LDI r12, 255
LDI r13, 164
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
