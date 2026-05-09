; DESCRIPTION: Draws a red line from (219, 236) to (102, 76).
; PLAN: r0=219(x1), r1=236(y1), r2=102(x2), r3=76(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 236
LDI r2, 102
LDI r3, 76
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
