; DESCRIPTION: Renders a magenta line between points (151, 0) and (263, 75).
; PLAN: r0=151(x1), r1=0(y1), r2=263(x2), r3=75(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 0
LDI r2, 263
LDI r3, 75
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
