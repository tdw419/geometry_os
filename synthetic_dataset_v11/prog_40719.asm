; DESCRIPTION: Renders a cyan line between points (29, 190) and (236, 110).
; PLAN: r0=29(x1), r1=190(y1), r2=236(x2), r3=110(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 190
LDI r2, 236
LDI r3, 110
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
