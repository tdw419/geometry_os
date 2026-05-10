; DESCRIPTION: Draws a white line from (302, 188) to (135, 104).
; PLAN: r0=302(x1), r1=188(y1), r2=135(x2), r3=104(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 188
LDI r2, 135
LDI r3, 104
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
