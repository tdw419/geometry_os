; DESCRIPTION: Draws a blue line from (156, 234) to (33, 120).
; PLAN: r0=156(x1), r1=234(y1), r2=33(x2), r3=120(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 234
LDI r2, 33
LDI r3, 120
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
