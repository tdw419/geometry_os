; DESCRIPTION: Renders a cyan line between points (164, 190) and (15, 121).
; PLAN: r0=164(x1), r1=190(y1), r2=15(x2), r3=121(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 190
LDI r2, 15
LDI r3, 121
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
