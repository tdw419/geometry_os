; DESCRIPTION: Renders a cyan line between points (227, 89) and (218, 2).
; PLAN: r0=227(x1), r1=89(y1), r2=218(x2), r3=2(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 89
LDI r2, 218
LDI r3, 2
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
