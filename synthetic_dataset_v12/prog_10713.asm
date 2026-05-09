; DESCRIPTION: Renders a black line between points (175, 185) and (346, 112).
; PLAN: r0=175(x1), r1=185(y1), r2=346(x2), r3=112(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 185
LDI r2, 346
LDI r3, 112
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
