; DESCRIPTION: Draws a green line from (170, 57) to (447, 182).
; PLAN: r0=170(x1), r1=57(y1), r2=447(x2), r3=182(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 57
LDI r2, 447
LDI r3, 182
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
