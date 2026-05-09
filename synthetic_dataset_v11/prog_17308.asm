; DESCRIPTION: Draws a blue line from (79, 102) to (105, 210).
; PLAN: r0=79(x1), r1=102(y1), r2=105(x2), r3=210(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 102
LDI r2, 105
LDI r3, 210
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
