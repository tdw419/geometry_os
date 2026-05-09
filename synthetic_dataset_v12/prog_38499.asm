; DESCRIPTION: Draws a green line from (196, 187) to (124, 191).
; PLAN: r0=196(x1), r1=187(y1), r2=124(x2), r3=191(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 187
LDI r2, 124
LDI r3, 191
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
