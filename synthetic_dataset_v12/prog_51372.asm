; DESCRIPTION: Draws a white line from (225, 28) to (172, 11).
; PLAN: r0=225(x1), r1=28(y1), r2=172(x2), r3=11(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 28
LDI r2, 172
LDI r3, 11
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
