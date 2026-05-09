; DESCRIPTION: Draws a green line from (399, 3) to (174, 241).
; PLAN: r0=399(x1), r1=3(y1), r2=174(x2), r3=241(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 3
LDI r2, 174
LDI r3, 241
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
