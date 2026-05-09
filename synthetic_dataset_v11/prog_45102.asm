; DESCRIPTION: Renders a magenta line between points (14, 195) and (123, 162).
; PLAN: r0=14(x1), r1=195(y1), r2=123(x2), r3=162(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 195
LDI r2, 123
LDI r3, 162
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
