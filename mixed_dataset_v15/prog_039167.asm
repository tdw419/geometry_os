; DESCRIPTION: Renders a magenta line segment connecting (56, 32) to (215, 55).
; PLAN: r0=56(x1), r1=32(y1), r2=215(x2), r3=55(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 32
LDI r2, 215
LDI r3, 55
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
