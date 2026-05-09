; DESCRIPTION: Renders a cyan line between points (360, 169) and (283, 137).
; PLAN: r0=360(x1), r1=169(y1), r2=283(x2), r3=137(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 169
LDI r2, 283
LDI r3, 137
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
