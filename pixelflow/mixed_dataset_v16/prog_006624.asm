; DESCRIPTION: Renders a black line between points (289, 69) and (253, 125).
; PLAN: r0=289(x1), r1=69(y1), r2=253(x2), r3=125(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 69
LDI r2, 253
LDI r3, 125
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
