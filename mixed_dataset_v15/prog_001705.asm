; DESCRIPTION: Renders a orange line between points (368, 196) and (252, 125).
; PLAN: r0=368(x1), r1=196(y1), r2=252(x2), r3=125(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 196
LDI r2, 252
LDI r3, 125
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
