; DESCRIPTION: Draws a red line from (218, 200) to (449, 241).
; PLAN: r0=218(x1), r1=200(y1), r2=449(x2), r3=241(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 200
LDI r2, 449
LDI r3, 241
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
