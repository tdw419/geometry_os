; DESCRIPTION: Draws a white line from (219, 26) to (207, 34).
; PLAN: r0=219(x1), r1=26(y1), r2=207(x2), r3=34(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 26
LDI r2, 207
LDI r3, 34
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
