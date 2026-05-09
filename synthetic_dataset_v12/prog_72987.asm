; DESCRIPTION: Places a magenta line segment connecting (480, 175) to (28, 81).
; PLAN: r0=480(x1), r1=175(y1), r2=28(x2), r3=81(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 175
LDI r2, 28
LDI r3, 81
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
