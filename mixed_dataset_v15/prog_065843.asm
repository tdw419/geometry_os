; DESCRIPTION: Renders a magenta line between points (213, 148) and (43, 33).
; PLAN: r0=213(x1), r1=148(y1), r2=43(x2), r3=33(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 148
LDI r2, 43
LDI r3, 33
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
