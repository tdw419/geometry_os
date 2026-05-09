; DESCRIPTION: Draws a blue line from (174, 171) to (152, 74).
; PLAN: r0=174(x1), r1=171(y1), r2=152(x2), r3=74(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 171
LDI r2, 152
LDI r3, 74
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
