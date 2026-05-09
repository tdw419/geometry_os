; DESCRIPTION: Renders a black line between points (113, 250) and (102, 73).
; PLAN: r0=113(x1), r1=250(y1), r2=102(x2), r3=73(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 250
LDI r2, 102
LDI r3, 73
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
