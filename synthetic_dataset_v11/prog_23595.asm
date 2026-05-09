; DESCRIPTION: Draws a black line from (125, 171) to (216, 62).
; PLAN: r0=125(x1), r1=171(y1), r2=216(x2), r3=62(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 171
LDI r2, 216
LDI r3, 62
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
