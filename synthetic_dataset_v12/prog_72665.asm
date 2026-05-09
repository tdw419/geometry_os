; DESCRIPTION: Composite: Renders a black line between points (139, 231) and (368, 125) then Places a white dot at position (361, 57).
; PLAN: r0=139(x1), r1=231(y1), r2=368(x2), r3=125(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=361(x), r6=57(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 139
LDI r1, 231
LDI r2, 368
LDI r3, 125
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 361
LDI r6, 57
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
