; DESCRIPTION: Renders a cyan line between points (195, 33) and (153, 201).
; PLAN: r0=195(x1), r1=33(y1), r2=153(x2), r3=201(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 33
LDI r2, 153
LDI r3, 201
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
