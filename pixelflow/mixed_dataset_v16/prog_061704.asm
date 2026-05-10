; DESCRIPTION: Renders a cyan line between points (87, 199) and (359, 104).
; PLAN: r0=87(x1), r1=199(y1), r2=359(x2), r3=104(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 199
LDI r2, 359
LDI r3, 104
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
