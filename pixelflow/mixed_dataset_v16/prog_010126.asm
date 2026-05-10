; DESCRIPTION: Renders a black line between points (368, 173) and (29, 125).
; PLAN: r0=368(x1), r1=173(y1), r2=29(x2), r3=125(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 173
LDI r2, 29
LDI r3, 125
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
