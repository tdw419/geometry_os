; DESCRIPTION: Renders a white line between points (71, 239) and (250, 145).
; PLAN: r0=71(x1), r1=239(y1), r2=250(x2), r3=145(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 239
LDI r2, 250
LDI r3, 145
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
