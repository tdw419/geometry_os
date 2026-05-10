; DESCRIPTION: Renders a white line between points (497, 54) and (24, 125).
; PLAN: r0=497(x1), r1=54(y1), r2=24(x2), r3=125(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 54
LDI r2, 24
LDI r3, 125
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
