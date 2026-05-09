; DESCRIPTION: Draws a red line from (336, 108) to (263, 1).
; PLAN: r0=336(x1), r1=108(y1), r2=263(x2), r3=1(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 108
LDI r2, 263
LDI r3, 1
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
