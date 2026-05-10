; DESCRIPTION: Renders a cyan line between points (424, 77) and (471, 233).
; PLAN: r0=424(x1), r1=77(y1), r2=471(x2), r3=233(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 77
LDI r2, 471
LDI r3, 233
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
