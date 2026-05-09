; DESCRIPTION: Draws a white line from (229, 58) to (125, 36).
; PLAN: r0=229(x1), r1=58(y1), r2=125(x2), r3=36(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 58
LDI r2, 125
LDI r3, 36
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
