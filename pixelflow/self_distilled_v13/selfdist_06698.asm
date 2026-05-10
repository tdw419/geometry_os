; DESCRIPTION: Renders a blue line segment connecting (42, 68) to (328, 99).
; PLAN: r0=42(x1), r1=68(y1), r2=328(x2), r3=99(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 68
LDI r2, 328
LDI r3, 99
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
