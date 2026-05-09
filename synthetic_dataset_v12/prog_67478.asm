; DESCRIPTION: Draws a blue line from (234, 18) to (65, 176).
; PLAN: r0=234(x1), r1=18(y1), r2=65(x2), r3=176(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 18
LDI r2, 65
LDI r3, 176
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
