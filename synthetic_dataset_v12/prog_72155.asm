; DESCRIPTION: Renders a magenta line between points (167, 148) and (140, 40).
; PLAN: r0=167(x1), r1=148(y1), r2=140(x2), r3=40(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 148
LDI r2, 140
LDI r3, 40
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
