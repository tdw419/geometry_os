; DESCRIPTION: Places a black line segment connecting (346, 177) to (262, 147).
; PLAN: r0=346(x1), r1=177(y1), r2=262(x2), r3=147(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 177
LDI r2, 262
LDI r3, 147
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
