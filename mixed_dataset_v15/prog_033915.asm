; DESCRIPTION: Draws a orange line from (124, 3) to (294, 31).
; PLAN: r0=124(x1), r1=3(y1), r2=294(x2), r3=31(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 3
LDI r2, 294
LDI r3, 31
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
