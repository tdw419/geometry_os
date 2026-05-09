; DESCRIPTION: Renders a blue line between points (260, 93) and (412, 154).
; PLAN: r0=260(x1), r1=93(y1), r2=412(x2), r3=154(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 93
LDI r2, 412
LDI r3, 154
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
