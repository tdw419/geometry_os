; DESCRIPTION: Draws a green line from (161, 51) to (232, 103).
; PLAN: r0=161(x1), r1=51(y1), r2=232(x2), r3=103(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 51
LDI r2, 232
LDI r3, 103
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
