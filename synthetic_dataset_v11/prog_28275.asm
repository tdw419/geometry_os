; DESCRIPTION: Draws a blue line from (3, 236) to (174, 107).
; PLAN: r0=3(x1), r1=236(y1), r2=174(x2), r3=107(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 236
LDI r2, 174
LDI r3, 107
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
