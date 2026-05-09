; DESCRIPTION: Draws a cyan line from (85, 94) to (190, 96).
; PLAN: r0=85(x1), r1=94(y1), r2=190(x2), r3=96(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 94
LDI r2, 190
LDI r3, 96
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
