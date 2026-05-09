; DESCRIPTION: Renders a cyan line between points (190, 176) and (96, 145).
; PLAN: r0=190(x1), r1=176(y1), r2=96(x2), r3=145(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 176
LDI r2, 96
LDI r3, 145
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
