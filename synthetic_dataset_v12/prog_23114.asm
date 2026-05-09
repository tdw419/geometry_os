; DESCRIPTION: Draws a white line from (419, 190) to (233, 244).
; PLAN: r0=419(x1), r1=190(y1), r2=233(x2), r3=244(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 190
LDI r2, 233
LDI r3, 244
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
