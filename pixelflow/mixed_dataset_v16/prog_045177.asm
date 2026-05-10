; DESCRIPTION: Renders a orange line between points (329, 33) and (467, 39).
; PLAN: r0=329(x1), r1=33(y1), r2=467(x2), r3=39(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 33
LDI r2, 467
LDI r3, 39
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
