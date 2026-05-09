; DESCRIPTION: Draws a red line from (399, 187) to (441, 125).
; PLAN: r0=399(x1), r1=187(y1), r2=441(x2), r3=125(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 187
LDI r2, 441
LDI r3, 125
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
