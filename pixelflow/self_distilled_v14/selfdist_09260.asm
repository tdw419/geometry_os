; DESCRIPTION: Draws a yellow line from (308, 160) to (2, 176).
; PLAN: r0=308(x1), r1=160(y1), r2=2(x2), r3=176(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 160
LDI r2, 2
LDI r3, 176
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
