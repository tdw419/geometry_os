; DESCRIPTION: Draws a red line from (321, 189) to (121, 64).
; PLAN: r0=321(x1), r1=189(y1), r2=121(x2), r3=64(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 189
LDI r2, 121
LDI r3, 64
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
