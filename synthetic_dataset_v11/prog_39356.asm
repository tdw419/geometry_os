; DESCRIPTION: Draws a green line from (129, 87) to (37, 76).
; PLAN: r0=129(x1), r1=87(y1), r2=37(x2), r3=76(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 87
LDI r2, 37
LDI r3, 76
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
