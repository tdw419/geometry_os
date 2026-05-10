; DESCRIPTION: Composite: Renders a green line between points (203, 126) and (253, 104) then Places a white dot at position (437, 240).
; PLAN: r0=203(x1), r1=126(y1), r2=253(x2), r3=104(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=437(x), r6=240(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 203
LDI r1, 126
LDI r2, 253
LDI r3, 104
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 437
LDI r6, 240
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
