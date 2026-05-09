; DESCRIPTION: Draws a yellow line from (377, 0) to (308, 91).
; PLAN: r0=377(x1), r1=0(y1), r2=308(x2), r3=91(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 0
LDI r2, 308
LDI r3, 91
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
