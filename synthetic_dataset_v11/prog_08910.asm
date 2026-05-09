; DESCRIPTION: Draws a white line from (35, 91) to (26, 209).
; PLAN: r0=35(x1), r1=91(y1), r2=26(x2), r3=209(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 91
LDI r2, 26
LDI r3, 209
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
