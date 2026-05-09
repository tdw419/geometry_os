; DESCRIPTION: Renders a yellow line between points (437, 22) and (511, 146).
; PLAN: r0=437(x1), r1=22(y1), r2=511(x2), r3=146(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 22
LDI r2, 511
LDI r3, 146
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
