; DESCRIPTION: Draws a red line from (422, 190) to (377, 0).
; PLAN: r0=422(x1), r1=190(y1), r2=377(x2), r3=0(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 190
LDI r2, 377
LDI r3, 0
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
