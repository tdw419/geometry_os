; DESCRIPTION: Renders a green line between points (171, 115) and (377, 63).
; PLAN: r0=171(x1), r1=115(y1), r2=377(x2), r3=63(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 115
LDI r2, 377
LDI r3, 63
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
