; DESCRIPTION: Renders a cyan line between points (149, 5) and (378, 4).
; PLAN: r0=149(x1), r1=5(y1), r2=378(x2), r3=4(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 5
LDI r2, 378
LDI r3, 4
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
