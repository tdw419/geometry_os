; DESCRIPTION: Draws a blue line from (272, 131) to (472, 27).
; PLAN: r0=272(x1), r1=131(y1), r2=472(x2), r3=27(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 131
LDI r2, 472
LDI r3, 27
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
