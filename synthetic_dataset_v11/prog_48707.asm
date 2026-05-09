; DESCRIPTION: Draws a white line from (189, 124) to (6, 220).
; PLAN: r0=189(x1), r1=124(y1), r2=6(x2), r3=220(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 124
LDI r2, 6
LDI r3, 220
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
