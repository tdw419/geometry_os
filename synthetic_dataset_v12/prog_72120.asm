; DESCRIPTION: Renders a cyan line between points (46, 218) and (200, 3).
; PLAN: r0=46(x1), r1=218(y1), r2=200(x2), r3=3(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 218
LDI r2, 200
LDI r3, 3
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
