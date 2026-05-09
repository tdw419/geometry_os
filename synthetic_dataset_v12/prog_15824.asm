; DESCRIPTION: Composite: Renders a black line between points (49, 105) and (307, 228) then Places a purple dot at position (223, 212) then Renders a purple disk with center (426, 124) and radius 56.
; PLAN: r0=49(x1), r1=105(y1), r2=307(x2), r3=228(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=223(x), r6=212(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=426(x), r11=124(y), r12=56(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 49
LDI r1, 105
LDI r2, 307
LDI r3, 228
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 223
LDI r6, 212
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 426
LDI r11, 124
LDI r12, 56
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
