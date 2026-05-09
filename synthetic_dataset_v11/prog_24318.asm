; DESCRIPTION: Renders a green line between points (214, 63) and (75, 158).
; PLAN: r0=214(x1), r1=63(y1), r2=75(x2), r3=158(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 63
LDI r2, 75
LDI r3, 158
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
