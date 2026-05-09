; DESCRIPTION: Draws a green line from (120, 229) to (124, 114).
; PLAN: r0=120(x1), r1=229(y1), r2=124(x2), r3=114(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 229
LDI r2, 124
LDI r3, 114
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
