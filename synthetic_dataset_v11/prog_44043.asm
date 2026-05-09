; DESCRIPTION: Places a magenta line segment connecting (32, 46) to (135, 18).
; PLAN: r0=32(x1), r1=46(y1), r2=135(x2), r3=18(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 46
LDI r2, 135
LDI r3, 18
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
