; DESCRIPTION: Draws a green line from (19, 241) to (124, 237).
; PLAN: r0=19(x1), r1=241(y1), r2=124(x2), r3=237(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 241
LDI r2, 124
LDI r3, 237
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
