; DESCRIPTION: Renders a magenta line between points (142, 32) and (172, 255).
; PLAN: r0=142(x1), r1=32(y1), r2=172(x2), r3=255(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 32
LDI r2, 172
LDI r3, 255
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
