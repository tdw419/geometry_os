; DESCRIPTION: Renders a yellow line segment connecting (337, 112) to (237, 42).
; PLAN: r0=337(x1), r1=112(y1), r2=237(x2), r3=42(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 112
LDI r2, 237
LDI r3, 42
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
