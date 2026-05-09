; DESCRIPTION: Draws a yellow line from (125, 131) to (100, 237).
; PLAN: r0=125(x1), r1=131(y1), r2=100(x2), r3=237(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 131
LDI r2, 100
LDI r3, 237
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
