; DESCRIPTION: Renders a cyan line between points (88, 229) and (93, 137).
; PLAN: r0=88(x1), r1=229(y1), r2=93(x2), r3=137(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 229
LDI r2, 93
LDI r3, 137
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
