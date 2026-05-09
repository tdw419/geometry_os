; DESCRIPTION: Draws a white line from (177, 124) to (151, 123).
; PLAN: r0=177(x1), r1=124(y1), r2=151(x2), r3=123(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 124
LDI r2, 151
LDI r3, 123
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
