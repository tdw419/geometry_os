; DESCRIPTION: Draws a red line from (283, 28) to (347, 31).
; PLAN: r0=283(x1), r1=28(y1), r2=347(x2), r3=31(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 28
LDI r2, 347
LDI r3, 31
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
