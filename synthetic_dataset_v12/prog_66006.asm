; DESCRIPTION: Draws a red line from (210, 63) to (283, 80).
; PLAN: r0=210(x1), r1=63(y1), r2=283(x2), r3=80(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 63
LDI r2, 283
LDI r3, 80
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
