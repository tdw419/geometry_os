; DESCRIPTION: Draws a green line from (226, 23) to (77, 203).
; PLAN: r0=226(x1), r1=23(y1), r2=77(x2), r3=203(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 23
LDI r2, 77
LDI r3, 203
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
