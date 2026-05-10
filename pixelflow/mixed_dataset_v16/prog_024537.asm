; DESCRIPTION: Composite: Renders a cyan line between points (156, 233) and (17, 104) then Places a green dot at position (473, 230).
; PLAN: r0=156(x1), r1=233(y1), r2=17(x2), r3=104(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=473(x), r6=230(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 156
LDI r1, 233
LDI r2, 17
LDI r3, 104
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 473
LDI r6, 230
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
