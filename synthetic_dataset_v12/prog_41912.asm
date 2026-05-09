; DESCRIPTION: Renders a white line between points (34, 212) and (96, 193).
; PLAN: r0=34(x1), r1=212(y1), r2=96(x2), r3=193(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 212
LDI r2, 96
LDI r3, 193
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
