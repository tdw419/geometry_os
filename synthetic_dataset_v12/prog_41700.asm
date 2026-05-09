; DESCRIPTION: Composite: Renders a cyan line between points (84, 250) and (137, 22) then Sets a single yellow pixel at (129, 210).
; PLAN: r0=84(x1), r1=250(y1), r2=137(x2), r3=22(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=129(x), r6=210(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 84
LDI r1, 250
LDI r2, 137
LDI r3, 22
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 129
LDI r6, 210
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
