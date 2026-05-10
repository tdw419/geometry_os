; DESCRIPTION: Renders a cyan line segment connecting (396, 193) to (191, 100).
; PLAN: r0=396(x1), r1=193(y1), r2=191(x2), r3=100(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 193
LDI r2, 191
LDI r3, 100
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
