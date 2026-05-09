; DESCRIPTION: Draws a blue line from (508, 219) to (307, 117).
; PLAN: r0=508(x1), r1=219(y1), r2=307(x2), r3=117(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 219
LDI r2, 307
LDI r3, 117
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
