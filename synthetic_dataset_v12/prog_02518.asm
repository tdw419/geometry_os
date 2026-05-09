; DESCRIPTION: Draws a blue line from (106, 125) to (165, 210).
; PLAN: r0=106(x1), r1=125(y1), r2=165(x2), r3=210(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 125
LDI r2, 165
LDI r3, 210
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
