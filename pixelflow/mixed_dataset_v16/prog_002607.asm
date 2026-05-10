; DESCRIPTION: Composite: Renders a magenta line between points (77, 100) and (458, 196) then Sets a single cyan pixel at (300, 119).
; PLAN: r0=77(x1), r1=100(y1), r2=458(x2), r3=196(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=300(x), r6=119(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 77
LDI r1, 100
LDI r2, 458
LDI r3, 196
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 300
LDI r6, 119
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
