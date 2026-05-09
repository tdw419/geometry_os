; DESCRIPTION: Renders a magenta line between points (181, 166) and (18, 83).
; PLAN: r0=181(x1), r1=166(y1), r2=18(x2), r3=83(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 166
LDI r2, 18
LDI r3, 83
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
