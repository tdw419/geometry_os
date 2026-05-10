; DESCRIPTION: Draws a green line from (218, 25) to (233, 190).
; PLAN: r0=218(x1), r1=25(y1), r2=233(x2), r3=190(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 25
LDI r2, 233
LDI r3, 190
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
