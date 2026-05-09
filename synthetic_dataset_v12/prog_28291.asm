; DESCRIPTION: Composite: Renders a white line between points (339, 180) and (413, 182) then Sets a single cyan pixel at (480, 155).
; PLAN: r0=339(x1), r1=180(y1), r2=413(x2), r3=182(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=480(x), r6=155(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 339
LDI r1, 180
LDI r2, 413
LDI r3, 182
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 480
LDI r6, 155
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
