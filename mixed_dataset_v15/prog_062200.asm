; DESCRIPTION: Renders a white line between points (51, 238) and (234, 87).
; PLAN: r0=51(x1), r1=238(y1), r2=234(x2), r3=87(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 238
LDI r2, 234
LDI r3, 87
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
