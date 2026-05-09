; DESCRIPTION: Renders a white line between points (183, 185) and (48, 71).
; PLAN: r0=183(x1), r1=185(y1), r2=48(x2), r3=71(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 185
LDI r2, 48
LDI r3, 71
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
