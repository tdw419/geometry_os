; DESCRIPTION: Draws a white line from (141, 133) to (418, 6).
; PLAN: r0=141(x1), r1=133(y1), r2=418(x2), r3=6(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 133
LDI r2, 418
LDI r3, 6
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
