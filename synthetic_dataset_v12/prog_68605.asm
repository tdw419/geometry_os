; DESCRIPTION: Draws a magenta line from (161, 22) to (48, 224).
; PLAN: r0=161(x1), r1=22(y1), r2=48(x2), r3=224(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 22
LDI r2, 48
LDI r3, 224
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
