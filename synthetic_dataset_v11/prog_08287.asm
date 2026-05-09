; DESCRIPTION: Draws a green line from (31, 202) to (194, 33).
; PLAN: r0=31(x1), r1=202(y1), r2=194(x2), r3=33(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 202
LDI r2, 194
LDI r3, 33
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
