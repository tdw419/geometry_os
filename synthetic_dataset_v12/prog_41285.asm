; DESCRIPTION: Draws a black line from (101, 95) to (234, 202).
; PLAN: r0=101(x1), r1=95(y1), r2=234(x2), r3=202(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 95
LDI r2, 234
LDI r3, 202
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
