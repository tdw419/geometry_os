; DESCRIPTION: Renders a cyan line between points (477, 190) and (20, 29).
; PLAN: r0=477(x1), r1=190(y1), r2=20(x2), r3=29(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 190
LDI r2, 20
LDI r3, 29
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
