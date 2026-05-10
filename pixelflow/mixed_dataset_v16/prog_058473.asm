; DESCRIPTION: Renders a cyan line between points (51, 232) and (382, 181).
; PLAN: r0=51(x1), r1=232(y1), r2=382(x2), r3=181(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 232
LDI r2, 382
LDI r3, 181
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
