; DESCRIPTION: Draws a blue line from (171, 40) to (217, 66).
; PLAN: r0=171(x1), r1=40(y1), r2=217(x2), r3=66(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 40
LDI r2, 217
LDI r3, 66
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
