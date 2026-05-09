; DESCRIPTION: Draws a green line from (314, 57) to (447, 174).
; PLAN: r0=314(x1), r1=57(y1), r2=447(x2), r3=174(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 57
LDI r2, 447
LDI r3, 174
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
