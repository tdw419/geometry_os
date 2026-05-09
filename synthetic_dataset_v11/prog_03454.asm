; DESCRIPTION: Places a magenta line segment connecting (47, 196) to (44, 242).
; PLAN: r0=47(x1), r1=196(y1), r2=44(x2), r3=242(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 196
LDI r2, 44
LDI r3, 242
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
