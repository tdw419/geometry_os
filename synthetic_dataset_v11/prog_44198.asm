; DESCRIPTION: Draws a blue line from (178, 134) to (196, 168).
; PLAN: r0=178(x1), r1=134(y1), r2=196(x2), r3=168(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 134
LDI r2, 196
LDI r3, 168
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
