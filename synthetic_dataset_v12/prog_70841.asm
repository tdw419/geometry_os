; DESCRIPTION: Draws a yellow line from (150, 153) to (5, 142).
; PLAN: r0=150(x1), r1=153(y1), r2=5(x2), r3=142(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 153
LDI r2, 5
LDI r3, 142
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
