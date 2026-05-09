; DESCRIPTION: Draws a orange line from (403, 59) to (291, 241).
; PLAN: r0=403(x1), r1=59(y1), r2=291(x2), r3=241(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 59
LDI r2, 291
LDI r3, 241
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
