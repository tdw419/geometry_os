; DESCRIPTION: Draws a white line from (60, 147) to (206, 45).
; PLAN: r0=60(x1), r1=147(y1), r2=206(x2), r3=45(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 147
LDI r2, 206
LDI r3, 45
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
