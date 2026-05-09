; DESCRIPTION: Renders a yellow line between points (79, 27) and (220, 133).
; PLAN: r0=79(x1), r1=27(y1), r2=220(x2), r3=133(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 27
LDI r2, 220
LDI r3, 133
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
