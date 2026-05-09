; DESCRIPTION: Draws a white line from (96, 114) to (40, 70).
; PLAN: r0=96(x1), r1=114(y1), r2=40(x2), r3=70(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 114
LDI r2, 40
LDI r3, 70
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
