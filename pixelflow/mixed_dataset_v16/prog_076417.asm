; DESCRIPTION: Composite: Renders a green line between points (215, 99) and (89, 127) then Sets a single cyan pixel at (286, 252).
; PLAN: r0=215(x1), r1=99(y1), r2=89(x2), r3=127(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=286(x), r6=252(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 215
LDI r1, 99
LDI r2, 89
LDI r3, 127
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 286
LDI r6, 252
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
