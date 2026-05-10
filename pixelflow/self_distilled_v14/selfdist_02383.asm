; DESCRIPTION: Renders a yellow line segment connecting (127, 8) to (23, 42).
; PLAN: r0=127(x1), r1=8(y1), r2=23(x2), r3=42(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 8
LDI r2, 23
LDI r3, 42
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
