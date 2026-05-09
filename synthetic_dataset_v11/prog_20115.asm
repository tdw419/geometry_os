; DESCRIPTION: Renders a cyan line between points (93, 169) and (176, 177).
; PLAN: r0=93(x1), r1=169(y1), r2=176(x2), r3=177(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 169
LDI r2, 176
LDI r3, 177
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
