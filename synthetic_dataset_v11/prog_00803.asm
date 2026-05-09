; DESCRIPTION: Draws a white line from (18, 106) to (124, 87).
; PLAN: r0=18(x1), r1=106(y1), r2=124(x2), r3=87(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 106
LDI r2, 124
LDI r3, 87
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
