; DESCRIPTION: Draws a red line from (26, 68) to (198, 70).
; PLAN: r0=26(x1), r1=68(y1), r2=198(x2), r3=70(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 68
LDI r2, 198
LDI r3, 70
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
