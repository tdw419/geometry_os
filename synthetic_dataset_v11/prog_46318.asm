; DESCRIPTION: Draws a black line from (210, 202) to (221, 131).
; PLAN: r0=210(x1), r1=202(y1), r2=221(x2), r3=131(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 202
LDI r2, 221
LDI r3, 131
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
