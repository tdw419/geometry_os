; DESCRIPTION: Draws a blue line from (79, 103) to (324, 231).
; PLAN: r0=79(x1), r1=103(y1), r2=324(x2), r3=231(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 103
LDI r2, 324
LDI r3, 231
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
