; DESCRIPTION: Renders a magenta line between points (213, 142) and (28, 10).
; PLAN: r0=213(x1), r1=142(y1), r2=28(x2), r3=10(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 142
LDI r2, 28
LDI r3, 10
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
