; DESCRIPTION: Draws a blue line from (81, 159) to (96, 152).
; PLAN: r0=81(x1), r1=159(y1), r2=96(x2), r3=152(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 159
LDI r2, 96
LDI r3, 152
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
