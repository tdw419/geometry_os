; DESCRIPTION: Renders a magenta line between points (111, 7) and (82, 203).
; PLAN: r0=111(x1), r1=7(y1), r2=82(x2), r3=203(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 7
LDI r2, 82
LDI r3, 203
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
