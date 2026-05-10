; DESCRIPTION: Draws a white line from (406, 104) to (355, 19).
; PLAN: r0=406(x1), r1=104(y1), r2=355(x2), r3=19(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 104
LDI r2, 355
LDI r3, 19
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
