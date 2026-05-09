; DESCRIPTION: Draws a red line from (345, 30) to (175, 131).
; PLAN: r0=345(x1), r1=30(y1), r2=175(x2), r3=131(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 30
LDI r2, 175
LDI r3, 131
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
