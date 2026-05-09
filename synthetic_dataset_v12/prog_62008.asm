; DESCRIPTION: Renders a magenta line between points (254, 253) and (83, 154).
; PLAN: r0=254(x1), r1=253(y1), r2=83(x2), r3=154(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 253
LDI r2, 83
LDI r3, 154
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
