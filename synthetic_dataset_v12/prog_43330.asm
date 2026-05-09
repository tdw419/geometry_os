; DESCRIPTION: Draws a green line from (308, 52) to (176, 100).
; PLAN: r0=308(x1), r1=52(y1), r2=176(x2), r3=100(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 52
LDI r2, 176
LDI r3, 100
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
