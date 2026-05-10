; DESCRIPTION: Draws a white line from (370, 78) to (59, 129).
; PLAN: r0=370(x1), r1=78(y1), r2=59(x2), r3=129(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 78
LDI r2, 59
LDI r3, 129
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
