; DESCRIPTION: Draws a orange line from (55, 80) to (403, 27).
; PLAN: r0=55(x1), r1=80(y1), r2=403(x2), r3=27(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 80
LDI r2, 403
LDI r3, 27
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
