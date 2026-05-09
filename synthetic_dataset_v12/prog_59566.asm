; DESCRIPTION: Renders a white line between points (316, 91) and (329, 1).
; PLAN: r0=316(x1), r1=91(y1), r2=329(x2), r3=1(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 91
LDI r2, 329
LDI r3, 1
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
