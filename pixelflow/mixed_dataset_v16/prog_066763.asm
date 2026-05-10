; DESCRIPTION: Renders a cyan line between points (51, 156) and (412, 73).
; PLAN: r0=51(x1), r1=156(y1), r2=412(x2), r3=73(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 156
LDI r2, 412
LDI r3, 73
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
