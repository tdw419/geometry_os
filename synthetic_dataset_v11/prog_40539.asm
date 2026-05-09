; DESCRIPTION: Renders a magenta line between points (105, 166) and (68, 214).
; PLAN: r0=105(x1), r1=166(y1), r2=68(x2), r3=214(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 166
LDI r2, 68
LDI r3, 214
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
