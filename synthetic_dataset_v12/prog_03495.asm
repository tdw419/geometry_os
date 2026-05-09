; DESCRIPTION: Renders a magenta line between points (176, 57) and (212, 19).
; PLAN: r0=176(x1), r1=57(y1), r2=212(x2), r3=19(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 57
LDI r2, 212
LDI r3, 19
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
