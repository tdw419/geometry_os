; DESCRIPTION: Draws a blue line from (145, 250) to (174, 27).
; PLAN: r0=145(x1), r1=250(y1), r2=174(x2), r3=27(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 250
LDI r2, 174
LDI r3, 27
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
