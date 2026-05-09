; DESCRIPTION: Renders a white line between points (341, 84) and (481, 134).
; PLAN: r0=341(x1), r1=84(y1), r2=481(x2), r3=134(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 84
LDI r2, 481
LDI r3, 134
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
