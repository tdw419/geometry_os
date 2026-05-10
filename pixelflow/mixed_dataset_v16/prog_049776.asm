; DESCRIPTION: Renders a magenta line segment connecting (51, 27) to (120, 162).
; PLAN: r0=51(x1), r1=27(y1), r2=120(x2), r3=162(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 27
LDI r2, 120
LDI r3, 162
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
