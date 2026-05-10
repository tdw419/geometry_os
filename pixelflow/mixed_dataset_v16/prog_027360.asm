; DESCRIPTION: Places a yellow line segment connecting (53, 92) to (450, 177).
; PLAN: r0=53(x1), r1=92(y1), r2=450(x2), r3=177(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 92
LDI r2, 450
LDI r3, 177
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
