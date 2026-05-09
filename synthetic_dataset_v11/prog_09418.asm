; DESCRIPTION: Draws a black line from (189, 95) to (103, 157).
; PLAN: r0=189(x1), r1=95(y1), r2=103(x2), r3=157(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 95
LDI r2, 103
LDI r3, 157
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
