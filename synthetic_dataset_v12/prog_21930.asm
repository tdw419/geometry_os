; DESCRIPTION: Draws a white line from (362, 87) to (266, 116).
; PLAN: r0=362(x1), r1=87(y1), r2=266(x2), r3=116(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 87
LDI r2, 266
LDI r3, 116
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
