; DESCRIPTION: Renders a blue line between points (503, 24) and (452, 125).
; PLAN: r0=503(x1), r1=24(y1), r2=452(x2), r3=125(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 24
LDI r2, 452
LDI r3, 125
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
