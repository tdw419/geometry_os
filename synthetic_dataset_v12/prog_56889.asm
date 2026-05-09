; DESCRIPTION: Draws a white line from (302, 83) to (117, 43).
; PLAN: r0=302(x1), r1=83(y1), r2=117(x2), r3=43(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 83
LDI r2, 117
LDI r3, 43
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
