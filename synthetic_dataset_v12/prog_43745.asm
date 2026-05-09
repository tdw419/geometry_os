; DESCRIPTION: Draws a red line from (218, 132) to (271, 158).
; PLAN: r0=218(x1), r1=132(y1), r2=271(x2), r3=158(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 132
LDI r2, 271
LDI r3, 158
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
