; DESCRIPTION: Draws a yellow line from (385, 190) to (389, 173).
; PLAN: r0=385(x1), r1=190(y1), r2=389(x2), r3=173(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 190
LDI r2, 389
LDI r3, 173
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
