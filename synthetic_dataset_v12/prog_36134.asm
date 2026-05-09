; DESCRIPTION: Draws a orange line from (263, 58) to (308, 165).
; PLAN: r0=263(x1), r1=58(y1), r2=308(x2), r3=165(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 58
LDI r2, 308
LDI r3, 165
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
