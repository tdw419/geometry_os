; DESCRIPTION: Draws a blue line from (124, 40) to (117, 164).
; PLAN: r0=124(x1), r1=40(y1), r2=117(x2), r3=164(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 40
LDI r2, 117
LDI r3, 164
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
