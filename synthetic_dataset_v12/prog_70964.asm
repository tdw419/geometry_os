; DESCRIPTION: Draws a orange line from (405, 16) to (508, 125).
; PLAN: r0=405(x1), r1=16(y1), r2=508(x2), r3=125(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 16
LDI r2, 508
LDI r3, 125
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
