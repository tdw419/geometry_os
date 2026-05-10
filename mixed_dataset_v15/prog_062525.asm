; DESCRIPTION: Draws a magenta line from (224, 3) to (254, 151).
; PLAN: r0=224(x1), r1=3(y1), r2=254(x2), r3=151(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 3
LDI r2, 254
LDI r3, 151
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
