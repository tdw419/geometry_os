; DESCRIPTION: Draws a white line from (236, 181) to (463, 10).
; PLAN: r0=236(x1), r1=181(y1), r2=463(x2), r3=10(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 181
LDI r2, 463
LDI r3, 10
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
