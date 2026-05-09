; DESCRIPTION: Draws a orange line from (121, 186) to (338, 21).
; PLAN: r0=121(x1), r1=186(y1), r2=338(x2), r3=21(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 186
LDI r2, 338
LDI r3, 21
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
