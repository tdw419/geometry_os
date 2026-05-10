; DESCRIPTION: Draws a red line from (352, 63) to (188, 7).
; PLAN: r0=352(x1), r1=63(y1), r2=188(x2), r3=7(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 63
LDI r2, 188
LDI r3, 7
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
