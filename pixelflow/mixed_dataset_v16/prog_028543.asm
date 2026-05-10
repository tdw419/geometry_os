; DESCRIPTION: Renders a magenta line segment connecting (207, 64) to (329, 177).
; PLAN: r0=207(x1), r1=64(y1), r2=329(x2), r3=177(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 64
LDI r2, 329
LDI r3, 177
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
