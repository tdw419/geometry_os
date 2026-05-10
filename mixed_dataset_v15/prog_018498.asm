; DESCRIPTION: Draws a black line from (40, 124) to (362, 214).
; PLAN: r0=40(x1), r1=124(y1), r2=362(x2), r3=214(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 124
LDI r2, 362
LDI r3, 214
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
