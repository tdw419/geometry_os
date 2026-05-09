; DESCRIPTION: Draws a yellow line from (164, 37) to (124, 214).
; PLAN: r0=164(x1), r1=37(y1), r2=124(x2), r3=214(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 37
LDI r2, 124
LDI r3, 214
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
