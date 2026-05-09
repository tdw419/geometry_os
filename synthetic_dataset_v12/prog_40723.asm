; DESCRIPTION: Renders a magenta line between points (180, 86) and (244, 224).
; PLAN: r0=180(x1), r1=86(y1), r2=244(x2), r3=224(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 86
LDI r2, 244
LDI r3, 224
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
