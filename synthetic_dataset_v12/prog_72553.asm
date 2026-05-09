; DESCRIPTION: Draws a white line from (508, 241) to (385, 219).
; PLAN: r0=508(x1), r1=241(y1), r2=385(x2), r3=219(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 241
LDI r2, 385
LDI r3, 219
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
