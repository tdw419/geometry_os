; DESCRIPTION: Renders a cyan line between points (214, 169) and (6, 179).
; PLAN: r0=214(x1), r1=169(y1), r2=6(x2), r3=179(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 169
LDI r2, 6
LDI r3, 179
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
