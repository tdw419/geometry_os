; DESCRIPTION: Draws a red line from (345, 237) to (1, 9).
; PLAN: r0=345(x1), r1=237(y1), r2=1(x2), r3=9(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 237
LDI r2, 1
LDI r3, 9
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
