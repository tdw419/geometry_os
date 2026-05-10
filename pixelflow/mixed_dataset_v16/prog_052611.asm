; DESCRIPTION: Draws a black line from (511, 149) to (470, 212).
; PLAN: r0=511(x1), r1=149(y1), r2=470(x2), r3=212(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 511
LDI r1, 149
LDI r2, 470
LDI r3, 212
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
