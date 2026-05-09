; DESCRIPTION: Draws a blue line from (131, 144) to (174, 23).
; PLAN: r0=131(x1), r1=144(y1), r2=174(x2), r3=23(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 144
LDI r2, 174
LDI r3, 23
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
