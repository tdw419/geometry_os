; DESCRIPTION: Draws a green line from (162, 125) to (334, 39).
; PLAN: r0=162(x1), r1=125(y1), r2=334(x2), r3=39(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 125
LDI r2, 334
LDI r3, 39
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
