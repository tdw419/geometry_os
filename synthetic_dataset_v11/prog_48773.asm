; DESCRIPTION: Draws a blue line from (26, 125) to (151, 150).
; PLAN: r0=26(x1), r1=125(y1), r2=151(x2), r3=150(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 125
LDI r2, 151
LDI r3, 150
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
