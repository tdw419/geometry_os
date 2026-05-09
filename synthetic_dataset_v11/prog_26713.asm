; DESCRIPTION: Renders a green line between points (107, 138) and (222, 180).
; PLAN: r0=107(x1), r1=138(y1), r2=222(x2), r3=180(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 138
LDI r2, 222
LDI r3, 180
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
