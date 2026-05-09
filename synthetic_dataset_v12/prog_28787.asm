; DESCRIPTION: Composite: Renders a green line between points (213, 88) and (129, 114) then Renders a white disk with center (405, 133) and radius 76 then Places a orange dot at position (501, 206).
; PLAN: r0=213(x1), r1=88(y1), r2=129(x2), r3=114(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=405(x), r6=133(y), r7=76(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=501(x), r11=206(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 213
LDI r1, 88
LDI r2, 129
LDI r3, 114
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 405
LDI r6, 133
LDI r7, 76
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 501
LDI r11, 206
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
