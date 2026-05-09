; DESCRIPTION: Draws a white line from (36, 176) to (9, 156).
; PLAN: r0=36(x1), r1=176(y1), r2=9(x2), r3=156(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 176
LDI r2, 9
LDI r3, 156
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
