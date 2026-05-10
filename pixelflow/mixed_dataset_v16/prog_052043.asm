; DESCRIPTION: Draws a orange line from (446, 225) to (299, 199).
; PLAN: r0=446(x1), r1=225(y1), r2=299(x2), r3=199(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 225
LDI r2, 299
LDI r3, 199
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
