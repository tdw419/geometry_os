; DESCRIPTION: Draws a black line from (429, 212) to (333, 46).
; PLAN: r0=429(x1), r1=212(y1), r2=333(x2), r3=46(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 212
LDI r2, 333
LDI r3, 46
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
