; DESCRIPTION: Renders a magenta line between points (47, 76) and (294, 101).
; PLAN: r0=47(x1), r1=76(y1), r2=294(x2), r3=101(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 76
LDI r2, 294
LDI r3, 101
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
