; DESCRIPTION: Renders a red line between points (22, 72) and (32, 154).
; PLAN: r0=22(x1), r1=72(y1), r2=32(x2), r3=154(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 72
LDI r2, 32
LDI r3, 154
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
