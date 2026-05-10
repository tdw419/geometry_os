; DESCRIPTION: Renders a cyan line between points (190, 114) and (477, 85).
; PLAN: r0=190(x1), r1=114(y1), r2=477(x2), r3=85(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 114
LDI r2, 477
LDI r3, 85
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
