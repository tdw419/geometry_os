; DESCRIPTION: Renders a green line between points (213, 21) and (483, 136).
; PLAN: r0=213(x1), r1=21(y1), r2=483(x2), r3=136(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 21
LDI r2, 483
LDI r3, 136
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
