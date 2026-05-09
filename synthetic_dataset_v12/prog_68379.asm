; DESCRIPTION: Places a magenta line segment connecting (240, 25) to (331, 223).
; PLAN: r0=240(x1), r1=25(y1), r2=331(x2), r3=223(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 25
LDI r2, 331
LDI r3, 223
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
