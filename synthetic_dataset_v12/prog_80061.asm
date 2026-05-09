; DESCRIPTION: Renders a magenta line between points (146, 166) and (112, 154).
; PLAN: r0=146(x1), r1=166(y1), r2=112(x2), r3=154(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 166
LDI r2, 112
LDI r3, 154
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
