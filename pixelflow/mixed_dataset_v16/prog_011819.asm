; DESCRIPTION: Renders a orange line between points (339, 176) and (190, 195).
; PLAN: r0=339(x1), r1=176(y1), r2=190(x2), r3=195(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 176
LDI r2, 190
LDI r3, 195
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
