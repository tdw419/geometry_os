; DESCRIPTION: Composite: Renders a cyan disk with center (52, 186) and radius 19 then Renders a white line between points (322, 181) and (324, 40) then Places a purple dot at position (299, 184).
; PLAN: r0=52(x), r1=186(y), r2=19(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=322(x1), r6=181(y1), r7=324(x2), r8=40(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=299(x), r11=184(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 52
LDI r1, 186
LDI r2, 19
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 322
LDI r6, 181
LDI r7, 324
LDI r8, 40
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 299
LDI r11, 184
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
