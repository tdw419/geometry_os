; DESCRIPTION: Draws a white line from (225, 196) to (83, 140).
; PLAN: r0=225(x1), r1=196(y1), r2=83(x2), r3=140(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 196
LDI r2, 83
LDI r3, 140
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
