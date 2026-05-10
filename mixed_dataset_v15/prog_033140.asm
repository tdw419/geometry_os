; DESCRIPTION: Renders a magenta line between points (441, 166) and (122, 203).
; PLAN: r0=441(x1), r1=166(y1), r2=122(x2), r3=203(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 166
LDI r2, 122
LDI r3, 203
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
