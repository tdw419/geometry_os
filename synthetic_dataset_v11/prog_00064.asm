; DESCRIPTION: Draws a blue line from (212, 240) to (208, 172).
; PLAN: r0=212(x1), r1=240(y1), r2=208(x2), r3=172(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 240
LDI r2, 208
LDI r3, 172
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
