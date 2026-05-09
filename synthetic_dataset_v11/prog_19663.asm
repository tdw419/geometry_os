; DESCRIPTION: Places a green line segment connecting (253, 179) to (152, 247).
; PLAN: r0=253(x1), r1=179(y1), r2=152(x2), r3=247(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 179
LDI r2, 152
LDI r3, 247
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
