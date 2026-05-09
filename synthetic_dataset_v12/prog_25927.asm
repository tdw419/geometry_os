; DESCRIPTION: Draws a green line from (181, 31) to (345, 179).
; PLAN: r0=181(x1), r1=31(y1), r2=345(x2), r3=179(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 31
LDI r2, 345
LDI r3, 179
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
