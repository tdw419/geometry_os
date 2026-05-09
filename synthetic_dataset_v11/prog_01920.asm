; DESCRIPTION: Draws a orange line from (198, 57) to (51, 126).
; PLAN: r0=198(x1), r1=57(y1), r2=51(x2), r3=126(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 57
LDI r2, 51
LDI r3, 126
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
