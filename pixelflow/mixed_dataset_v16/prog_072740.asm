; DESCRIPTION: Draws a blue line from (113, 9) to (75, 165).
; PLAN: r0=113(x1), r1=9(y1), r2=75(x2), r3=165(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 9
LDI r2, 75
LDI r3, 165
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
