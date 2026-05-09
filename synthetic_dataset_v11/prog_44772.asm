; DESCRIPTION: Renders a green line between points (102, 199) and (118, 171).
; PLAN: r0=102(x1), r1=199(y1), r2=118(x2), r3=171(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 199
LDI r2, 118
LDI r3, 171
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
