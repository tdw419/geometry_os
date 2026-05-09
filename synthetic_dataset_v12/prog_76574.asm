; DESCRIPTION: Renders a magenta line between points (365, 7) and (259, 232).
; PLAN: r0=365(x1), r1=7(y1), r2=259(x2), r3=232(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 7
LDI r2, 259
LDI r3, 232
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
