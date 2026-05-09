; DESCRIPTION: Places a magenta line segment connecting (226, 138) to (197, 101).
; PLAN: r0=226(x1), r1=138(y1), r2=197(x2), r3=101(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 138
LDI r2, 197
LDI r3, 101
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
