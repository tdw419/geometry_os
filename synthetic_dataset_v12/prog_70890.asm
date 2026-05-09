; DESCRIPTION: Renders a green line between points (135, 138) and (237, 53).
; PLAN: r0=135(x1), r1=138(y1), r2=237(x2), r3=53(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 138
LDI r2, 237
LDI r3, 53
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
