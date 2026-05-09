; DESCRIPTION: Renders a cyan line between points (336, 153) and (190, 110).
; PLAN: r0=336(x1), r1=153(y1), r2=190(x2), r3=110(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 153
LDI r2, 190
LDI r3, 110
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
