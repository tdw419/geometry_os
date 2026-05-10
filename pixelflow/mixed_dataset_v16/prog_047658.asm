; DESCRIPTION: Renders a magenta line between points (20, 27) and (113, 66).
; PLAN: r0=20(x1), r1=27(y1), r2=113(x2), r3=66(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 27
LDI r2, 113
LDI r3, 66
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
