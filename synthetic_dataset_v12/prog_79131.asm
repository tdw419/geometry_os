; DESCRIPTION: Draws a white line from (328, 5) to (203, 43).
; PLAN: r0=328(x1), r1=5(y1), r2=203(x2), r3=43(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 5
LDI r2, 203
LDI r3, 43
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
