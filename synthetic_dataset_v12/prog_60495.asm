; DESCRIPTION: Draws a blue line from (125, 9) to (248, 113).
; PLAN: r0=125(x1), r1=9(y1), r2=248(x2), r3=113(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 9
LDI r2, 248
LDI r3, 113
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
