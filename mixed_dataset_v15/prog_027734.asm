; DESCRIPTION: Draws a red line from (329, 67) to (448, 232).
; PLAN: r0=329(x1), r1=67(y1), r2=448(x2), r3=232(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 67
LDI r2, 448
LDI r3, 232
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
