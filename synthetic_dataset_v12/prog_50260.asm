; DESCRIPTION: Renders a purple line between points (0, 220) and (240, 154).
; PLAN: r0=0(x1), r1=220(y1), r2=240(x2), r3=154(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 220
LDI r2, 240
LDI r3, 154
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
