; DESCRIPTION: Renders a cyan line between points (110, 184) and (200, 72).
; PLAN: r0=110(x1), r1=184(y1), r2=200(x2), r3=72(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 184
LDI r2, 200
LDI r3, 72
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
