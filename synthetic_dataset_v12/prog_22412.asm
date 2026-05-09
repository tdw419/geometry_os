; DESCRIPTION: Renders a cyan line between points (21, 201) and (285, 233).
; PLAN: r0=21(x1), r1=201(y1), r2=285(x2), r3=233(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 201
LDI r2, 285
LDI r3, 233
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
