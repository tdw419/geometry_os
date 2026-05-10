; DESCRIPTION: Renders a green line between points (133, 63) and (368, 243).
; PLAN: r0=133(x1), r1=63(y1), r2=368(x2), r3=243(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 63
LDI r2, 368
LDI r3, 243
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
