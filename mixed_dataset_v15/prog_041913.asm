; DESCRIPTION: Renders a magenta line between points (293, 144) and (76, 173).
; PLAN: r0=293(x1), r1=144(y1), r2=76(x2), r3=173(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 144
LDI r2, 76
LDI r3, 173
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
