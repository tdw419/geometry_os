; DESCRIPTION: Places a magenta line segment connecting (233, 226) to (188, 204).
; PLAN: r0=233(x1), r1=226(y1), r2=188(x2), r3=204(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 226
LDI r2, 188
LDI r3, 204
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
