; DESCRIPTION: Renders a yellow line between points (22, 95) and (82, 171).
; PLAN: r0=22(x1), r1=95(y1), r2=82(x2), r3=171(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 95
LDI r2, 82
LDI r3, 171
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
