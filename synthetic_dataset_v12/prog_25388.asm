; DESCRIPTION: Places a red line segment connecting (154, 216) to (92, 204).
; PLAN: r0=154(x1), r1=216(y1), r2=92(x2), r3=204(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 216
LDI r2, 92
LDI r3, 204
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
