; DESCRIPTION: Renders a cyan line between points (501, 7) and (227, 190).
; PLAN: r0=501(x1), r1=7(y1), r2=227(x2), r3=190(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 7
LDI r2, 227
LDI r3, 190
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
