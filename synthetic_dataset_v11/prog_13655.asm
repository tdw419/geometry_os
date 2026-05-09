; DESCRIPTION: Draws a blue line from (79, 195) to (138, 64).
; PLAN: r0=79(x1), r1=195(y1), r2=138(x2), r3=64(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 195
LDI r2, 138
LDI r3, 64
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
