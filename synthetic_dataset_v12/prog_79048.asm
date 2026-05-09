; DESCRIPTION: Renders a magenta line between points (330, 114) and (81, 134).
; PLAN: r0=330(x1), r1=114(y1), r2=81(x2), r3=134(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 114
LDI r2, 81
LDI r3, 134
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
