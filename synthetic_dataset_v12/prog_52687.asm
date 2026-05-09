; DESCRIPTION: Draws a blue line from (468, 86) to (367, 131).
; PLAN: r0=468(x1), r1=86(y1), r2=367(x2), r3=131(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 86
LDI r2, 367
LDI r3, 131
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
