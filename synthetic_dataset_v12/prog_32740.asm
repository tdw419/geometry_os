; DESCRIPTION: Renders a cyan line between points (170, 51) and (414, 73).
; PLAN: r0=170(x1), r1=51(y1), r2=414(x2), r3=73(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 51
LDI r2, 414
LDI r3, 73
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
