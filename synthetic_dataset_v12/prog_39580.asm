; DESCRIPTION: Draws a orange line from (138, 171) to (405, 60).
; PLAN: r0=138(x1), r1=171(y1), r2=405(x2), r3=60(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 171
LDI r2, 405
LDI r3, 60
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
