; DESCRIPTION: Composite: Renders a cyan line between points (400, 12) and (159, 0) then Renders a black disk with center (164, 83) and radius 70 then Places a purple dot at position (373, 7).
; PLAN: r0=400(x1), r1=12(y1), r2=159(x2), r3=0(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=164(x), r6=83(y), r7=70(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=373(x), r11=7(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 400
LDI r1, 12
LDI r2, 159
LDI r3, 0
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 164
LDI r6, 83
LDI r7, 70
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 373
LDI r11, 7
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
