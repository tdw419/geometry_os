; DESCRIPTION: Places a green line segment connecting (92, 223) to (32, 181).
; PLAN: r0=92(x1), r1=223(y1), r2=32(x2), r3=181(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 223
LDI r2, 32
LDI r3, 181
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
