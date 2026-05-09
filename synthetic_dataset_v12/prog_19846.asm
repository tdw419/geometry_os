; DESCRIPTION: Places a blue line segment connecting (196, 226) to (337, 174).
; PLAN: r0=196(x1), r1=226(y1), r2=337(x2), r3=174(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 226
LDI r2, 337
LDI r3, 174
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
