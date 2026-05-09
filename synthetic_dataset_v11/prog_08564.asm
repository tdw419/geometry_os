; DESCRIPTION: Renders a magenta line between points (77, 21) and (172, 154).
; PLAN: r0=77(x1), r1=21(y1), r2=172(x2), r3=154(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 21
LDI r2, 172
LDI r3, 154
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
