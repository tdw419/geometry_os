; DESCRIPTION: Renders a magenta line between points (237, 224) and (162, 60).
; PLAN: r0=237(x1), r1=224(y1), r2=162(x2), r3=60(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 224
LDI r2, 162
LDI r3, 60
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
