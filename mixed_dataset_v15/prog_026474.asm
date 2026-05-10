; DESCRIPTION: Renders a purple line between points (166, 107) and (331, 154).
; PLAN: r0=166(x1), r1=107(y1), r2=331(x2), r3=154(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 107
LDI r2, 331
LDI r3, 154
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
