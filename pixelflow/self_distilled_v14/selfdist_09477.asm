; DESCRIPTION: Renders a yellow line segment connecting (128, 178) to (337, 150).
; PLAN: r0=128(x1), r1=178(y1), r2=337(x2), r3=150(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 178
LDI r2, 337
LDI r3, 150
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
