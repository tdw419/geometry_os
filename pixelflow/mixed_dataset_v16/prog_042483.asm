; DESCRIPTION: Renders a magenta line between points (237, 143) and (58, 220).
; PLAN: r0=237(x1), r1=143(y1), r2=58(x2), r3=220(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 143
LDI r2, 58
LDI r3, 220
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
