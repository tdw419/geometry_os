; DESCRIPTION: Draws a white line from (283, 77) to (187, 156).
; PLAN: r0=283(x1), r1=77(y1), r2=187(x2), r3=156(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 77
LDI r2, 187
LDI r3, 156
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
