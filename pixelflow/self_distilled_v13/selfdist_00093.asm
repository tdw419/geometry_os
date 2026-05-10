; DESCRIPTION: Renders a green line segment connecting (68, 32) to (264, 153).
; PLAN: r0=68(x1), r1=32(y1), r2=264(x2), r3=153(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 32
LDI r2, 264
LDI r3, 153
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
