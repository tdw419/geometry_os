; DESCRIPTION: Renders a cyan line between points (222, 169) and (226, 193).
; PLAN: r0=222(x1), r1=169(y1), r2=226(x2), r3=193(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 169
LDI r2, 226
LDI r3, 193
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
