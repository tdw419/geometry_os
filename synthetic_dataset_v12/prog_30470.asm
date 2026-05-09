; DESCRIPTION: Renders a magenta line between points (128, 199) and (130, 250).
; PLAN: r0=128(x1), r1=199(y1), r2=130(x2), r3=250(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 199
LDI r2, 130
LDI r3, 250
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
