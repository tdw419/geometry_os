; DESCRIPTION: Composite: . Then Renders a yellow line between points (163, 66) and (188, 234). Then Sets a single cyan pixel at (73, 37).
; PLAN: r0=163(x1), r1=66(y1), r2=188(x2), r3=234(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=73(x), r1=37(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a yellow line between points (163, 66) and (188, 234).
; PLAN: r0=163(x1), r1=66(y1), r2=188(x2), r3=234(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 66
LDI r2, 188
LDI r3, 234
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single cyan pixel at (73, 37).
; PLAN: r0=73(x), r1=37(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 73
LDI r1, 37
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
