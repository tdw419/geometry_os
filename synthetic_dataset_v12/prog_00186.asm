; DESCRIPTION: Places a magenta line segment connecting (409, 144) to (381, 255).
; PLAN: r0=409(x1), r1=144(y1), r2=381(x2), r3=255(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 144
LDI r2, 381
LDI r3, 255
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
