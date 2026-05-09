; DESCRIPTION: Draws a blue line from (145, 59) to (151, 138).
; PLAN: r0=145(x1), r1=59(y1), r2=151(x2), r3=138(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 59
LDI r2, 151
LDI r3, 138
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
