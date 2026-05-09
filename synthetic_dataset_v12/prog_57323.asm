; DESCRIPTION: Renders a magenta line between points (107, 154) and (224, 0).
; PLAN: r0=107(x1), r1=154(y1), r2=224(x2), r3=0(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 154
LDI r2, 224
LDI r3, 0
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
