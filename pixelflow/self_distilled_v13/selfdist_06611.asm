; DESCRIPTION: Draws a blue line from (326, 114) to (125, 57).
; PLAN: r0=326(x1), r1=114(y1), r2=125(x2), r3=57(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 114
LDI r2, 125
LDI r3, 57
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
