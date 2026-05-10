; DESCRIPTION: Draws a green line from (212, 181) to (115, 108).
; PLAN: r0=212(x1), r1=181(y1), r2=115(x2), r3=108(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 181
LDI r2, 115
LDI r3, 108
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
