; DESCRIPTION: Renders a green line between points (102, 168) and (341, 138).
; PLAN: r0=102(x1), r1=168(y1), r2=341(x2), r3=138(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 168
LDI r2, 341
LDI r3, 138
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
