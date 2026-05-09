; DESCRIPTION: Places a yellow line segment connecting (226, 152) to (92, 64).
; PLAN: r0=226(x1), r1=152(y1), r2=92(x2), r3=64(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 152
LDI r2, 92
LDI r3, 64
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
