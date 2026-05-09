; DESCRIPTION: Draws a green line from (352, 145) to (505, 247).
; PLAN: r0=352(x1), r1=145(y1), r2=505(x2), r3=247(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 145
LDI r2, 505
LDI r3, 247
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
