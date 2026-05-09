; DESCRIPTION: Renders a cyan line between points (190, 53) and (98, 87).
; PLAN: r0=190(x1), r1=53(y1), r2=98(x2), r3=87(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 53
LDI r2, 98
LDI r3, 87
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
