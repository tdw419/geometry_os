; DESCRIPTION: Draws a yellow line from (308, 233) to (160, 206).
; PLAN: r0=308(x1), r1=233(y1), r2=160(x2), r3=206(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 233
LDI r2, 160
LDI r3, 206
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
