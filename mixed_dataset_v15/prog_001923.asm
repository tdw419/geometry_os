; DESCRIPTION: Renders a magenta line between points (507, 107) and (135, 144).
; PLAN: r0=507(x1), r1=107(y1), r2=135(x2), r3=144(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 107
LDI r2, 135
LDI r3, 144
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
