; DESCRIPTION: Draws a purple line from (153, 48) to (140, 154).
; PLAN: r0=153(x1), r1=48(y1), r2=140(x2), r3=154(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 48
LDI r2, 140
LDI r3, 154
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
