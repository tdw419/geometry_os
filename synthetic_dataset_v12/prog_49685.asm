; DESCRIPTION: Renders a white line between points (407, 5) and (54, 125).
; PLAN: r0=407(x1), r1=5(y1), r2=54(x2), r3=125(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 5
LDI r2, 54
LDI r3, 125
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
