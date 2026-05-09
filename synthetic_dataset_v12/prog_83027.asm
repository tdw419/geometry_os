; DESCRIPTION: Draws a white line from (406, 4) to (54, 205).
; PLAN: r0=406(x1), r1=4(y1), r2=54(x2), r3=205(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 4
LDI r2, 54
LDI r3, 205
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
