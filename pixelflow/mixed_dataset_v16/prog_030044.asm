; DESCRIPTION: Draws a green line from (308, 95) to (229, 136).
; PLAN: r0=308(x1), r1=95(y1), r2=229(x2), r3=136(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 95
LDI r2, 229
LDI r3, 136
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
