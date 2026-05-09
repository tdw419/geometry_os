; DESCRIPTION: Draws a red line from (345, 252) to (417, 64).
; PLAN: r0=345(x1), r1=252(y1), r2=417(x2), r3=64(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 252
LDI r2, 417
LDI r3, 64
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
