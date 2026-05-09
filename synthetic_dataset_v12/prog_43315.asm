; DESCRIPTION: Composite: Renders a green line between points (184, 217) and (107, 199) then Places a yellow dot at position (32, 118).
; PLAN: r0=184(x1), r1=217(y1), r2=107(x2), r3=199(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=32(x), r6=118(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 184
LDI r1, 217
LDI r2, 107
LDI r3, 199
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 32
LDI r6, 118
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
