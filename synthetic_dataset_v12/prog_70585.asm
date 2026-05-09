; DESCRIPTION: Renders a cyan line between points (343, 50) and (201, 51).
; PLAN: r0=343(x1), r1=50(y1), r2=201(x2), r3=51(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 50
LDI r2, 201
LDI r3, 51
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
