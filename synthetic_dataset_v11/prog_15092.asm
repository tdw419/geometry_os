; DESCRIPTION: Draws a green line from (159, 23) to (49, 31).
; PLAN: r0=159(x1), r1=23(y1), r2=49(x2), r3=31(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 23
LDI r2, 49
LDI r3, 31
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
