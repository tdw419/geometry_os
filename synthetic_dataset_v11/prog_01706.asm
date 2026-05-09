; DESCRIPTION: Draws a yellow line from (50, 190) to (36, 221).
; PLAN: r0=50(x1), r1=190(y1), r2=36(x2), r3=221(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 190
LDI r2, 36
LDI r3, 221
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
