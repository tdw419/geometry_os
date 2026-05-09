; DESCRIPTION: Renders a white line between points (46, 134) and (53, 203).
; PLAN: r0=46(x1), r1=134(y1), r2=53(x2), r3=203(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 134
LDI r2, 53
LDI r3, 203
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
