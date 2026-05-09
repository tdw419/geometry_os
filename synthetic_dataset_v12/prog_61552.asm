; DESCRIPTION: Composite: Sets a single blue pixel at (435, 95) then Draws a cyan line from (52, 11) to (164, 129).
; PLAN: r0=435(x), r1=95(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=52(x1), r6=11(y1), r7=164(x2), r8=129(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 435
LDI r1, 95
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 52
LDI r6, 11
LDI r7, 164
LDI r8, 129
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
