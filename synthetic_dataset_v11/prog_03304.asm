; DESCRIPTION: Places a magenta line segment connecting (109, 213) to (233, 180).
; PLAN: r0=109(x1), r1=213(y1), r2=233(x2), r3=180(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 213
LDI r2, 233
LDI r3, 180
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
