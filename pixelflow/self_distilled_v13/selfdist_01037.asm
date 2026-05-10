; DESCRIPTION: Renders a red line segment connecting (173, 114) to (288, 125).
; PLAN: r0=173(x1), r1=114(y1), r2=288(x2), r3=125(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 114
LDI r2, 288
LDI r3, 125
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
