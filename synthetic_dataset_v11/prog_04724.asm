; DESCRIPTION: Draws a red line from (99, 128) to (4, 251).
; PLAN: r0=99(x1), r1=128(y1), r2=4(x2), r3=251(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 128
LDI r2, 4
LDI r3, 251
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
