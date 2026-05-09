; DESCRIPTION: Renders a cyan line between points (222, 218) and (249, 89).
; PLAN: r0=222(x1), r1=218(y1), r2=249(x2), r3=89(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 218
LDI r2, 249
LDI r3, 89
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
