; DESCRIPTION: Draws a blue line from (229, 229) to (102, 117).
; PLAN: r0=229(x1), r1=229(y1), r2=102(x2), r3=117(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 229
LDI r2, 102
LDI r3, 117
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
