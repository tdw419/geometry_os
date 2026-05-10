; DESCRIPTION: Renders a white line between points (382, 134) and (212, 81).
; PLAN: r0=382(x1), r1=134(y1), r2=212(x2), r3=81(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 134
LDI r2, 212
LDI r3, 81
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
