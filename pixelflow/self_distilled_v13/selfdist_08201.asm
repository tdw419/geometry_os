; DESCRIPTION: Renders a cyan line segment connecting (194, 193) to (63, 133).
; PLAN: r0=194(x1), r1=193(y1), r2=63(x2), r3=133(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 193
LDI r2, 63
LDI r3, 133
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
