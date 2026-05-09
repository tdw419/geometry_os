; DESCRIPTION: Draws a orange line from (151, 14) to (61, 221).
; PLAN: r0=151(x1), r1=14(y1), r2=61(x2), r3=221(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 14
LDI r2, 61
LDI r3, 221
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
