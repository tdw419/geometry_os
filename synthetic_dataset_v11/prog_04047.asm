; DESCRIPTION: Draws a white line from (160, 241) to (11, 39).
; PLAN: r0=160(x1), r1=241(y1), r2=11(x2), r3=39(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 241
LDI r2, 11
LDI r3, 39
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
