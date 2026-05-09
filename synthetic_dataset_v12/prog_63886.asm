; DESCRIPTION: Renders a magenta line between points (420, 245) and (429, 71).
; PLAN: r0=420(x1), r1=245(y1), r2=429(x2), r3=71(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 245
LDI r2, 429
LDI r3, 71
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
