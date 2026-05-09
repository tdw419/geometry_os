; DESCRIPTION: Renders a cyan line between points (378, 65) and (129, 206).
; PLAN: r0=378(x1), r1=65(y1), r2=129(x2), r3=206(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 65
LDI r2, 129
LDI r3, 206
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
