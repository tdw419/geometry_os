; DESCRIPTION: Draws a white line from (3, 43) to (91, 162).
; PLAN: r0=3(x1), r1=43(y1), r2=91(x2), r3=162(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 43
LDI r2, 91
LDI r3, 162
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
