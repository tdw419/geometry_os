; DESCRIPTION: Renders a green line between points (396, 101) and (503, 210).
; PLAN: r0=396(x1), r1=101(y1), r2=503(x2), r3=210(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 101
LDI r2, 503
LDI r3, 210
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
