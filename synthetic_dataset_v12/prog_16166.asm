; DESCRIPTION: Composite: Renders a black disk with center (347, 184) and radius 53 then Places a cyan dot at position (151, 47) then Renders a purple line between points (231, 174) and (458, 240).
; PLAN: r0=347(x), r1=184(y), r2=53(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=151(x), r6=47(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=231(x1), r11=174(y1), r12=458(x2), r13=240(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 347
LDI r1, 184
LDI r2, 53
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 151
LDI r6, 47
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 231
LDI r11, 174
LDI r12, 458
LDI r13, 240
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
