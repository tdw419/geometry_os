; DESCRIPTION: Renders a magenta line between points (420, 247) and (212, 186).
; PLAN: r0=420(x1), r1=247(y1), r2=212(x2), r3=186(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 247
LDI r2, 212
LDI r3, 186
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
