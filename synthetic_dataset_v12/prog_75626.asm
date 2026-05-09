; DESCRIPTION: Draws a yellow line from (45, 119) to (103, 61).
; PLAN: r0=45(x1), r1=119(y1), r2=103(x2), r3=61(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 119
LDI r2, 103
LDI r3, 61
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
