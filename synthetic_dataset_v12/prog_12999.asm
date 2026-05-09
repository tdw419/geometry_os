; DESCRIPTION: Renders a green line between points (382, 142) and (68, 115).
; PLAN: r0=382(x1), r1=142(y1), r2=68(x2), r3=115(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 142
LDI r2, 68
LDI r3, 115
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
