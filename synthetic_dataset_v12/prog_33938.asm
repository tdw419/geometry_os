; DESCRIPTION: Renders a cyan line between points (505, 169) and (472, 244).
; PLAN: r0=505(x1), r1=169(y1), r2=472(x2), r3=244(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 169
LDI r2, 472
LDI r3, 244
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
