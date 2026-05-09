; DESCRIPTION: Renders a cyan line between points (248, 17) and (177, 44).
; PLAN: r0=248(x1), r1=17(y1), r2=177(x2), r3=44(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 17
LDI r2, 177
LDI r3, 44
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
