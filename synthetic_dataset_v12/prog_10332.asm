; DESCRIPTION: Composite: Renders a orange line between points (260, 136) and (184, 59) then Places a purple dot at position (437, 74).
; PLAN: r0=260(x1), r1=136(y1), r2=184(x2), r3=59(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=437(x), r6=74(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 260
LDI r1, 136
LDI r2, 184
LDI r3, 59
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 437
LDI r6, 74
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
