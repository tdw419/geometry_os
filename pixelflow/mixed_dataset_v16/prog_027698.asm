; DESCRIPTION: Places a magenta line segment connecting (173, 81) to (188, 46).
; PLAN: r0=173(x1), r1=81(y1), r2=188(x2), r3=46(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 81
LDI r2, 188
LDI r3, 46
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
