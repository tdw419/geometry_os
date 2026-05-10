; DESCRIPTION: Renders a cyan line between points (136, 254) and (83, 98).
; PLAN: r0=136(x1), r1=254(y1), r2=83(x2), r3=98(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 254
LDI r2, 83
LDI r3, 98
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
