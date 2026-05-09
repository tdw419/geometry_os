; DESCRIPTION: Places a magenta line segment connecting (453, 81) to (384, 199).
; PLAN: r0=453(x1), r1=81(y1), r2=384(x2), r3=199(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 81
LDI r2, 384
LDI r3, 199
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
