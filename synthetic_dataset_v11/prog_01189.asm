; DESCRIPTION: Draws a green line from (151, 65) to (77, 241).
; PLAN: r0=151(x1), r1=65(y1), r2=77(x2), r3=241(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 65
LDI r2, 77
LDI r3, 241
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
