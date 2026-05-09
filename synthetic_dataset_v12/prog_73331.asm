; DESCRIPTION: Draws a green line from (45, 190) to (466, 197).
; PLAN: r0=45(x1), r1=190(y1), r2=466(x2), r3=197(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 190
LDI r2, 466
LDI r3, 197
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
