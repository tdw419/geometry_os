; DESCRIPTION: Composite: Renders a cyan line between points (271, 34) and (27, 135) then Sets a single cyan pixel at (89, 94).
; PLAN: r0=271(x1), r1=34(y1), r2=27(x2), r3=135(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=89(x), r6=94(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 271
LDI r1, 34
LDI r2, 27
LDI r3, 135
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 89
LDI r6, 94
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
