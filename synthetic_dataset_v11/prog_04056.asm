; DESCRIPTION: Renders a cyan line between points (181, 201) and (140, 206).
; PLAN: r0=181(x1), r1=201(y1), r2=140(x2), r3=206(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 201
LDI r2, 140
LDI r3, 206
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
