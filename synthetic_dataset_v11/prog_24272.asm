; DESCRIPTION: Draws a green line from (50, 83) to (248, 190).
; PLAN: r0=50(x1), r1=83(y1), r2=248(x2), r3=190(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 83
LDI r2, 248
LDI r3, 190
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
