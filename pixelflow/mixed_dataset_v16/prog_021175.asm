; DESCRIPTION: Draws a red line from (501, 125) to (470, 15).
; PLAN: r0=501(x1), r1=125(y1), r2=470(x2), r3=15(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 125
LDI r2, 470
LDI r3, 15
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
