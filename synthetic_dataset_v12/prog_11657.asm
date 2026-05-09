; DESCRIPTION: Composite: Renders a cyan line between points (110, 72) and (249, 177) then Sets a single magenta pixel at (287, 55).
; PLAN: r0=110(x1), r1=72(y1), r2=249(x2), r3=177(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=287(x), r6=55(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 110
LDI r1, 72
LDI r2, 249
LDI r3, 177
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 287
LDI r6, 55
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
