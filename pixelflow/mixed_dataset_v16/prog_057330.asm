; DESCRIPTION: Composite: Renders a cyan line between points (229, 115) and (1, 252) then Places a purple dot at position (40, 191).
; PLAN: r0=229(x1), r1=115(y1), r2=1(x2), r3=252(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=40(x), r6=191(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 229
LDI r1, 115
LDI r2, 1
LDI r3, 252
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 40
LDI r6, 191
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
