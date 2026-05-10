; DESCRIPTION: Draws a white line from (191, 38) to (375, 101).
; PLAN: r0=191(x1), r1=38(y1), r2=375(x2), r3=101(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 38
LDI r2, 375
LDI r3, 101
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
