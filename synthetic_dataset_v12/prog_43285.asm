; DESCRIPTION: Draws a white line from (208, 35) to (34, 26).
; PLAN: r0=208(x1), r1=35(y1), r2=34(x2), r3=26(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 35
LDI r2, 34
LDI r3, 26
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
