; DESCRIPTION: Renders a green line between points (152, 193) and (195, 74).
; PLAN: r0=152(x1), r1=193(y1), r2=195(x2), r3=74(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 193
LDI r2, 195
LDI r3, 74
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
