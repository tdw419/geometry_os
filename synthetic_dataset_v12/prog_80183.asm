; DESCRIPTION: Places a magenta line segment connecting (164, 219) to (152, 46).
; PLAN: r0=164(x1), r1=219(y1), r2=152(x2), r3=46(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 219
LDI r2, 152
LDI r3, 46
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
