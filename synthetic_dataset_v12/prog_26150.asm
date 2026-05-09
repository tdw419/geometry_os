; DESCRIPTION: Draws a white line from (227, 203) to (340, 71).
; PLAN: r0=227(x1), r1=203(y1), r2=340(x2), r3=71(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 203
LDI r2, 340
LDI r3, 71
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
