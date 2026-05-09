; DESCRIPTION: Places a purple line segment connecting (202, 253) to (290, 51).
; PLAN: r0=202(x1), r1=253(y1), r2=290(x2), r3=51(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 253
LDI r2, 290
LDI r3, 51
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
