; DESCRIPTION: Composite: Sets a single cyan pixel at (75, 155) then Renders a blue line between points (338, 153) and (28, 17).
; PLAN: r0=75(x), r1=155(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=338(x1), r6=153(y1), r7=28(x2), r8=17(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 75
LDI r1, 155
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 338
LDI r6, 153
LDI r7, 28
LDI r8, 17
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
