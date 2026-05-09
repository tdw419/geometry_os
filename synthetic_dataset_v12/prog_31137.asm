; DESCRIPTION: Draws a white line from (464, 26) to (287, 205).
; PLAN: r0=464(x1), r1=26(y1), r2=287(x2), r3=205(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 26
LDI r2, 287
LDI r3, 205
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
