; DESCRIPTION: Renders a magenta line between points (426, 32) and (453, 224).
; PLAN: r0=426(x1), r1=32(y1), r2=453(x2), r3=224(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 32
LDI r2, 453
LDI r3, 224
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
