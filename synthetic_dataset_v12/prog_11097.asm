; DESCRIPTION: Draws a white line from (25, 149) to (101, 207).
; PLAN: r0=25(x1), r1=149(y1), r2=101(x2), r3=207(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 149
LDI r2, 101
LDI r3, 207
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
