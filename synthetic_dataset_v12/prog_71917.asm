; DESCRIPTION: Renders a magenta line between points (285, 36) and (381, 255).
; PLAN: r0=285(x1), r1=36(y1), r2=381(x2), r3=255(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 36
LDI r2, 381
LDI r3, 255
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
