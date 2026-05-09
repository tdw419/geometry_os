; DESCRIPTION: Renders a cyan line between points (112, 100) and (238, 46).
; PLAN: r0=112(x1), r1=100(y1), r2=238(x2), r3=46(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 100
LDI r2, 238
LDI r3, 46
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
