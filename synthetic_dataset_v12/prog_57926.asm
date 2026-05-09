; DESCRIPTION: Renders a magenta line between points (224, 214) and (194, 16).
; PLAN: r0=224(x1), r1=214(y1), r2=194(x2), r3=16(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 214
LDI r2, 194
LDI r3, 16
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
