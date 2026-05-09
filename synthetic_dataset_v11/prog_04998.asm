; DESCRIPTION: Renders a magenta line between points (237, 40) and (48, 104).
; PLAN: r0=237(x1), r1=40(y1), r2=48(x2), r3=104(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 40
LDI r2, 48
LDI r3, 104
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
