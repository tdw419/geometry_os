; DESCRIPTION: Draws a white line from (175, 203) to (17, 75).
; PLAN: r0=175(x1), r1=203(y1), r2=17(x2), r3=75(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 203
LDI r2, 17
LDI r3, 75
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
