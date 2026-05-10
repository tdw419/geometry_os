; DESCRIPTION: Renders a magenta line segment connecting (138, 32) to (32, 139).
; PLAN: r0=138(x1), r1=32(y1), r2=32(x2), r3=139(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 32
LDI r2, 32
LDI r3, 139
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
