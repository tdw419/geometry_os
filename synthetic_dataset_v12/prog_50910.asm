; DESCRIPTION: Draws a white line from (107, 75) to (501, 59).
; PLAN: r0=107(x1), r1=75(y1), r2=501(x2), r3=59(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 75
LDI r2, 501
LDI r3, 59
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
