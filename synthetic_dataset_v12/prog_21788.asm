; DESCRIPTION: Draws a white line from (453, 171) to (321, 241).
; PLAN: r0=453(x1), r1=171(y1), r2=321(x2), r3=241(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 171
LDI r2, 321
LDI r3, 241
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
