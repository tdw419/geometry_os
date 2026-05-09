; DESCRIPTION: Draws a white line from (40, 21) to (462, 22).
; PLAN: r0=40(x1), r1=21(y1), r2=462(x2), r3=22(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 21
LDI r2, 462
LDI r3, 22
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
