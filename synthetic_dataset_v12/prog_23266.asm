; DESCRIPTION: Renders a magenta line between points (400, 20) and (42, 154).
; PLAN: r0=400(x1), r1=20(y1), r2=42(x2), r3=154(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 20
LDI r2, 42
LDI r3, 154
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
