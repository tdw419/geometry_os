; DESCRIPTION: Renders a magenta line between points (164, 21) and (2, 162).
; PLAN: r0=164(x1), r1=21(y1), r2=2(x2), r3=162(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 21
LDI r2, 2
LDI r3, 162
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
