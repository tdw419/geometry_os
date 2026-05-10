; DESCRIPTION: Draws a magenta line from (142, 148) to (384, 154).
; PLAN: r0=142(x1), r1=148(y1), r2=384(x2), r3=154(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 148
LDI r2, 384
LDI r3, 154
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
