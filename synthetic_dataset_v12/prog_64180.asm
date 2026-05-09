; DESCRIPTION: Renders a blue line between points (267, 114) and (291, 194).
; PLAN: r0=267(x1), r1=114(y1), r2=291(x2), r3=194(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 114
LDI r2, 291
LDI r3, 194
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
