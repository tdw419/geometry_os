; DESCRIPTION: Composite: Draws a yellow line from (37, 97) to (488, 12) then Renders a white disk with center (195, 144) and radius 33 then Places a green dot at position (35, 72).
; PLAN: r0=37(x1), r1=97(y1), r2=488(x2), r3=12(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=195(x), r6=144(y), r7=33(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=35(x), r11=72(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 37
LDI r1, 97
LDI r2, 488
LDI r3, 12
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 195
LDI r6, 144
LDI r7, 33
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 35
LDI r11, 72
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
