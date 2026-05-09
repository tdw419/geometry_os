; DESCRIPTION: Composite: Draws a green line from (341, 49) to (164, 70) then Renders a white disk with center (26, 186) and radius 18 then Places a purple dot at position (108, 252).
; PLAN: r0=341(x1), r1=49(y1), r2=164(x2), r3=70(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=26(x), r6=186(y), r7=18(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=108(x), r11=252(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 341
LDI r1, 49
LDI r2, 164
LDI r3, 70
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 26
LDI r6, 186
LDI r7, 18
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 108
LDI r11, 252
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
