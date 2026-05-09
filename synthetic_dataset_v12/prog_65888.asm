; DESCRIPTION: Draws a white line from (471, 104) to (420, 28).
; PLAN: r0=471(x1), r1=104(y1), r2=420(x2), r3=28(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 104
LDI r2, 420
LDI r3, 28
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
