; DESCRIPTION: Draws a white line from (75, 217) to (175, 100).
; PLAN: r0=75(x1), r1=217(y1), r2=175(x2), r3=100(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 217
LDI r2, 175
LDI r3, 100
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
