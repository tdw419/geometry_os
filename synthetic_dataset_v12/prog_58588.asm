; DESCRIPTION: Renders a magenta line between points (474, 63) and (365, 250).
; PLAN: r0=474(x1), r1=63(y1), r2=365(x2), r3=250(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 63
LDI r2, 365
LDI r3, 250
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
