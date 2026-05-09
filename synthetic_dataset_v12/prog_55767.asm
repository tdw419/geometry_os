; DESCRIPTION: Renders a green line between points (262, 117) and (138, 155).
; PLAN: r0=262(x1), r1=117(y1), r2=138(x2), r3=155(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 117
LDI r2, 138
LDI r3, 155
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
