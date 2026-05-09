; DESCRIPTION: Composite: Renders a cyan line between points (55, 23) and (51, 123) then Places a white dot at position (1, 167).
; PLAN: r0=55(x1), r1=23(y1), r2=51(x2), r3=123(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=1(x), r6=167(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 55
LDI r1, 23
LDI r2, 51
LDI r3, 123
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 1
LDI r6, 167
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
