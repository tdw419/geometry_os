; DESCRIPTION: Renders a magenta line between points (238, 161) and (31, 241).
; PLAN: r0=238(x1), r1=161(y1), r2=31(x2), r3=241(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 161
LDI r2, 31
LDI r3, 241
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
