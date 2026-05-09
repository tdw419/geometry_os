; DESCRIPTION: Renders a cyan line between points (486, 233) and (72, 201).
; PLAN: r0=486(x1), r1=233(y1), r2=72(x2), r3=201(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 233
LDI r2, 72
LDI r3, 201
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
